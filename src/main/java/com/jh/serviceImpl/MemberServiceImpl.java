package com.jh.serviceImpl;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.dao.MemberDao;
import com.jh.dto.MemberDto;
import com.jh.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired     
	MemberDao dao;
	
	HttpSession session ;
	
	@Override
	public int findByEmailService(String email) {
		return dao.findByEmail(email);
	}
	
	@Override
	public int findByPwService(String pw) {
		return dao.findByPw(pw);
	}
	
	@Override
	public int findByMemberService(MemberDto dto) {
		return dao.findByMember(dto);
	}

	@Override
	public int findByNameService(MemberDto dto) {
		int cnt = dao.findByName(dto);
		return cnt;
	}

	@Override
	public List<MemberDto> findByMyInfoService(int loginId) {
		return dao.findByMyInfo(loginId);
	}
	
	@Override
	public void changeToNewInfoService(MemberDto dto) {
		dao.changeToNewInfo(dto);
	}	

	@Override
	public void changeToNewProfilePicService(MemberDto dto) {
		dao.changeToNewProfilePic(dto);
	}
	
	@Override
	public void insertMemberService(MemberDto dto) {
		dao.insertMember(dto);
	}
	
	@Override
	public void deleteMemberService(int loginId) {
		dao.deleteMember(loginId);
	}

	/*
	 * 로그인 인증 및 토큰 발급
	 */
	@Override
	public String naverLoginService(String code, String state) {
		String clientId = "0Gz87VHMqCp3feOSP6rD";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "HjkFopLUj4";//애플리케이션 클라이언트 시크릿값";
		String redirectURI;
		String apiURL;
		String access_token = "";
		String refresh_token = "";
		BufferedReader br;
		
		try {
			redirectURI = URLEncoder.encode("http://localhost:9096/SpringWeb/", "UTF-8");
			apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			apiURL += "client_id=" + clientId;
			apiURL += "&client_secret=" + clientSecret;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&code=" + code;
			apiURL += "&state=" + state;
			System.out.println("apiURL="+apiURL);

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			System.out.print("responseCode="+responseCode);
			
			if(responseCode==200) { // 정상 호출
			  br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
			  br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			
			while ((inputLine = br.readLine()) != null) {
			  res.append(inputLine);
			}
			br.close();
			
			if(responseCode==200) {
				System.out.println(res.toString());//토큰
				JSONParser parser = new JSONParser();
				Object obj = parser.parse(res.toString());
				JSONObject jsonObj = (JSONObject)obj;
				
				//String으로 가져오기	        
				access_token = (String)jsonObj.get("access_token");
				refresh_token = (String)jsonObj.get("refresh_token");
				//session.setAttribute("refresh_token", refresh_token);//세션으로 저장
			}
			//collback page(index)에서 토큰 조회 가능
		} catch (Exception e) {
		  e.printStackTrace();
		}
		return access_token;
	}
	
	
	/*
	 * 회원 정보 조회
	 */
	@Override
//	public List<MemberDto> getNaverMemberInfoService(String access_token) {
	public MemberDto getNaverMemberInfoService(String access_token) {
		BufferedReader br;
		String inputLine;
		MemberDto dto = new MemberDto();
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			if(access_token != null) {
				String apiUrl = "https://openapi.naver.com/v1/nid/me";
				URL url = new URL(apiUrl);
				String header = "Bearer " + access_token;
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization", header);
				int responseCode = con.getResponseCode();
				
				if(responseCode==200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				StringBuffer res = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					res.append(inputLine);
				}
				br.close();
				
				JSONParser parser = new JSONParser();
				Object obj = parser.parse(res.toString());
				JSONObject jsonObj = (JSONObject)obj;
				JSONObject resObj = (JSONObject)jsonObj.get("response");
				
				String email = (String)resObj.get("email");
				String naverCode = (String)resObj.get("id");//고유회원번호 ->pw로 저장함
				String name = (String)resObj.get("nickname");
				String birthDate = "";
				String birthday = (String)resObj.get("birthday");
				if(birthday==null) {
					birthDate = (String)resObj.get("birthyear");
				} else {
					birthDate = (String)resObj.get("birthyear") + "." + birthday;
				}
				String profilePic = (String)resObj.get("profile_image");
				
				dto.setEmail(email);
				dto.setPw(naverCode);
				dto.setName(name);
				dto.setBirthDate(birthDate);
				dto.setProfilePic(profilePic);
				
				if(dao.findByPw(naverCode) == 0) {
					/*
					 * 저장된 회원이 아니면 DB에 저장
					*/
					dao.insertMember(dto);
					dto.setMemberId(dao.findByMember(dto));
					list.add(dto);
				} else {
					/*
					 * 멤버 정보 조회
					*/
					list = dao.findByMyInfo(dao.findByMember(dto));
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} 
		//System.out.println("-------------로그인id="+list.get(0).getMemberId());
		//null값 나옴   새로고침 하면 list가 안만들어짐
		//session.setAttribute("loginId", list.get(0).getMemberId());
		return dto;
	}

	

}
