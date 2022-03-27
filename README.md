# 라이징테스트 작업내용

### 3/19 (토)
* 로그인/회원가입 VC 생성
* 앱 실행 초기에 사용자가 로그인 상태인지 여부 판단하여 회원가입VC를 모달로 띄움
* 메인화면에서 Tapman라이브러리 사용하여 상단탭 구현
* 홈VC - 인기탭 - TableView) Header생성하고, 광고배너&카테고리 리스트 생성

### 3/20 (일)
* 홈VC - 인기탭 - TableView) 제목과 4개의 Post를 보여주는 CollectionViewCell 생성
* 회원가입 VC 생성
* 이메일로 로그인 VC 생성
* 홈VC - 인기탭 - TableView Cell 생성
    * 카테고리 리스트
    * 오늘의 딜
    * Footer
    * 인기 동영상, 인기 사진 리스트
    * 사용자 리뷰 리스트

* 로그인 VC 생성
* 카카오 로그인 API 연결
* 회원가입 API 연결

### 3/21 (월)
* 로그인 API 연결
* 홈VC - 인기탭 - TableView Cell 생성 (기획전 리스트)
* 마이페이지VC 생성
* 약관동의 버튼 구조 수정
* 홈VC - 인기탭 상단 광고배너 이미지 API 연결

### 3/22 (화)
* 마이페이지VC에서 이동할 SettingVC 생성
* 프로필 수정 VC 생성, API 연결
* 마이페이지VC에 유저정보 조회하기 API 연결
* 스토어VC - 스토어홈 탭 완성

### 3/23 (수)
* 스토어VC - TableViewCell 생성
    * 인기 키워드 Cell
    * 인기상품 Cell

* 스토어VC, 마이페이지VC에 사용할 광고배너 이미지 API 연결
* 상품 상세페이지) Header생성
* 스토어VC API 연결
    * 오늘의딜 조회 API
    * 인기키워드 조회 API

* 상품 상세페이지) 구매버튼에 bottom sheet적용
* 상품 상세페이지) 유저들의 스타일링샷 Cell 생성
* 스토어VC - 상단탭) 오늘의딜 탭VC 생성

### 3/24(목)
* 상품페이지) 상품설명 펼지기, 접기 버튼 구현
* 프로필을 변경해도 마이페이지에 반영되지 않던 오류 수정
* 로그아웃 기능 추가
* 상품페이지VC 완성
* API 연결
    * 내가 본 상품과 연관상품 조회
    * 추천상품 조회
    * 인기상품 조회


### 3/25(금)
* API연결
    * 실시간 베스트 제품 조회
    * 제품 상세조회
    
* 실시간 베스트 VC 생성
* 장바구니VC 생성
* 조회한 상품을 "최근 조회한 상품"목록에 추가하고 UI 업데이트하는 기능 추가
* 로그인 여부에 따라 스토어VC의 화면 구성을 다르게 설정
* 제품 상세 페이지에서 구매하기 버튼을 통해 bottom sheet가 나타나도록 기능 추가

### 3/26(토)
* API연결
    * 장바구니 담기
    * 장바구니 조회
    * 장바구니에 담긴 상품 개수 수정
    * 장바구니에 담긴 상품 삭제
    
* 화면에 자잘한 오류 해결
    * 장바구니VC의 금액정보가 바로 업데이트되지 않던 문제
    * bottom sheet VC의 초기설정이 작동하지 않던 문제
    
* 결제VC) 배송정보, 결제자 정보, 담긴 아이템을 보여줄 Cell 생성
