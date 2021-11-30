# Description
+ 회원가입 로그인 글 작성,삭제 등이 가능한 게시판

# Run Screen
+ 화면의 크기에 반응하는 반응형 웹
![image](https://user-images.githubusercontent.com/89134202/141644976-b2b70349-1869-4896-89e6-1f07f00a95e6.png)
![image](https://user-images.githubusercontent.com/89134202/141644998-c8032531-2fef-44f5-942f-5e29b26aec26.png)
+ 로그인 기능 구현(메인화면으로 이동은 가능하나 메인화면 미완성) 
![게시판 메인](https://user-images.githubusercontent.com/89134202/141775454-9a80992c-02f4-48d0-9ec4-15287ff3e2ea.GIF)
+ ID나 Password가 다르다면 경고을 띄운다

|![image](https://user-images.githubusercontent.com/89134202/141775941-03bed534-73e3-4307-9f84-80f059cb32e4.png)|![image](https://user-images.githubusercontent.com/89134202/141775995-a4de91bf-5e52-4e1d-a619-c6f037a5d22e.png)|
+ 회원가입후 메인이동, 데이터베이스 통신
![image](https://user-images.githubusercontent.com/89134202/142763440-0924b463-cb96-4b34-9a28-1b0575f63d71.png)

+ 게시판에 작성 기능추가
![image](https://user-images.githubusercontent.com/89134202/142997041-268b9dc8-e1b2-4857-963f-86f3c57d2260.png)
![image](https://user-images.githubusercontent.com/89134202/143244398-4e0a6e0b-21fc-48c4-b5f6-b5f5edf60d6a.png)
+ 자신이 작성한 게시글 수정 삭제기능
![image](https://user-images.githubusercontent.com/89134202/143256674-af26d3e5-0f59-43cb-a59b-ca6c816477bc.png)
+ 자신이 작성하지 않은 게시글![권한없음](https://user-images.githubusercontent.com/89134202/143874042-0f1ba77a-c8a3-4c6d-97ce-f4f9e3fffc64.GIF)

+ 8번 게시글 수정![글 수정](https://user-images.githubusercontent.com/89134202/143874179-0d352653-4d14-4ca8-a0fe-f73e31db0dfb.GIF)

+ 8번 게시글 삭제![삭제](https://user-images.githubusercontent.com/89134202/143874219-1d2816bc-a2bb-48a3-bbfb-e53bbfb50726.GIF)

+ 메인화면 이미지 추가
![image](https://user-images.githubusercontent.com/89134202/144020405-452192d7-b069-4568-b31f-4cd766473fed.png)


# TodoList
~~서버와 데이터 통신~~

~~게시판 메인화면 작성게시판 정보가 데이터베이스에는 있는데 페이지에는 아직 못 넣었다~~

~~+ 글 작성,삭제~~

# 기록
보안상 문제로 웹에서 로컬파일을 수정하는게 불가능하여 배워본적 없는 서버쪽까지 건드려보게 돼서 기쁘다

강의와 mysql버전이 달라서 며칠간 고생했다;;11/21

글 제목에 utf8을 적용하려고 시행착오를 많이 격었다. 11/22~23

진짜 접을 뻔했다;; 고치고 다음날 되면 또 오류가 난다
ALTER TABLE user convert to charset utf8;  
특수문자 또한 출력이 가능하게 해 악성스크립트 방지 11/24

또 데이터베이스에 문제가 생겼었다 mysql installer들어가고 user.DAO,bbsDAO파일을 어떻게 하다보니 연동이 됐다, 삭제 수정기능 추가 근데 삭제 했을 떄 데이터베이스에 남아있어서 그런지 번호가 채워지지 않는다 11/29

메인화면에 이미지, 이미지를 넘기는 버튼 추가 11/30
# References

[참고한 유튜브](https://www.youtube.com/watch?v=MtxFWczSFqU&list=PLRx0vPvlEmdAZv_okJzox5wj2gG_fNh_6&index=2)
