# 화면보다 적은 데이터 받아왔을 때 무한 스크롤 우아하게 구현하기

## 상태관리 : Riverpod
## 패턴 : MVU 패턴
![KakaoTalk_Photo_2021-10-28-12-24-48](https://user-images.githubusercontent.com/54665433/139181265-e5c7b31b-477c-4e15-b2aa-0ec097c9ea83.jpeg)




### 빌더안에서 다시 불러오기 방식
그려지는 인덱스가 List의 마지막 길이와 같을 때 새로 불러오게 만드는 방식
-> 불러오는 데이터의 크기가 화면의 크기보다 작으면 넘칠 때 까지 자동으로 불러와줌


https://user-images.githubusercontent.com/54665433/139181629-d8392018-30e0-4c9f-ac1f-47f7f6abc660.mp4


### 스크롤 포지션을 이용해서 다시 불러오기 방식
스크롤이 최대 스크롤 길이 - @ 만큼 되었을 때 새로 불러오게 만드는 방식
-> 불러오는 데이터의 크기가 화면의 크기보다 작으면 한번 스크롤 해야지 불러옴.

https://user-images.githubusercontent.com/54665433/139181749-a135fd18-218c-48e7-8b12-7baeeb9974ff.mp4

