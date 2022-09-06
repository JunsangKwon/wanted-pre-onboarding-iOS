# wanted-pre-onboarding-iOS
원티드 프리온보딩 iOS 코스 사전 과제

## 🎁 프로젝트 구조 - MVC
<img width="691" alt="스크린샷 2022-09-05 오후 4 17 00" src="https://user-images.githubusercontent.com/61138164/188548225-a0bfcbc9-f902-430a-8104-35e5b6b4b2da.png">
- ViewController와 View를 분리하였습니다.<br>
- 여기서 Model은 NetworkService, ImageCacheManager 등이 있고 앱 내의 데이터를 담당합니다. <br>
- 프로젝트의 규모가 크지 않기 때문에 MVC 구조를 채택하였습니다.

## 📁 폴더 구조
<img width="230" alt="스크린샷 2022-09-05 오후 4 22 01" src="https://user-images.githubusercontent.com/61138164/188548361-6384478c-9c72-4d56-9b31-2c75cb621c78.png">

### Application 
- AppDelegate, SceneDelegate, Info.plist등 

### Resource 
- **Asset**: 오류를 대비한 이미지 "unknown.png" 
- **ApiKey.plist**: API의 key를 숨기기위한 plist 파일 

### Source 
- **Base**: 기본적으로 사용되는 것들 모음 
- **Feature**: 기능 구현에 사용되는 파일들 
- **Network**: 서버 통신을 위한 파일들 (NetworkError, WeatherDTO, NetworkService등)
- **Util**: Extension들이나 앱 안에서 사용하는 객체 모음

### Feature
- **CityWeather**: 20개의 도시의 날씨를 보여주는 화면 관련 파일 모음
- **DetailWeather**: 더 세부적인 날씨 정보를 보여주는 화면 관련 파일 모음


<br>

## 📱 구현 화면
### 첫 번째 화면 (20개의 도시의 날씨를 보여주는 화면)
<div>
<img width="250" height="550" src="https://user-images.githubusercontent.com/61138164/188548581-747595ad-311d-4f76-9204-0bfb0794d53a.png">
<img width="250" height="550" src="https://user-images.githubusercontent.com/61138164/188548628-fc73bef1-fc21-4187-85b9-bffbeb917976.png">
</div>

### 두 번째 화면 (선택한 도시의 세부적인 날씨를 보여주는 화면)
<div>
<img width="250" height="550" src="https://user-images.githubusercontent.com/61138164/188548590-d179d820-b673-403b-a43b-bcece4838e88.png">
<img width="250" height="550" src="https://user-images.githubusercontent.com/61138164/188548629-4c904546-7eb0-492d-ab6a-677069f99349.png">
</div>

## 기능 구현 방식
**AutoLayout**
- StoryBoard를 제거하고 코드로 View를 구현하였습니다.

**Networking**
- URLSession을 이용하여 NetworkService에서 네트워킹을 합니다.
- WeatherDTO를 통해 서버의 응답을 받고, 필요한 데이터만 뽑아서 WeatherEntity로 전달하는 방식으로 구현하였습니다.
- VC의 weatherList로 WeatherEntity를 전달하고, 20개의 도시가 다 도착했을 때, reloadData를 진행하여 CollectionView에 데이터가 보여집니다.
- async, await 방식으로 동시성을 관리하였습니다.

**Cache**
- ImageCacheManager라는 객체를 생성합니다. 
- NSCache를 사용합니다.
- UIImageView의 extension 내부에서 캐시를 확인하고, 이미지를 설정해주는 메서드를 구현하였습니다.
- 이미지 캐시가 존재하면, 캐시에서 불러오고 없다면 서버에서 이미지를 불러옵니다.

**Dark Mode**
- 다크 모드를 대응하였습니다.

## 발생했던 문제
1) 날씨 정보가 20개가 안오는 경우가 존재함
- 닐씨 정보 API 호출을 했을 때, 10번에 1번씩은 한 도시씩 누락되서 보여지는 문제가 있었습니다.
- weatherList의 log를 확인해본 결과, 19개의 도시 정보가 담긴 weatherList와 1개의 도시 정보가 담긴 weatherList가 존재했습니다.
- 이는 동시성의 문제라고 생각하여서, 비교적 쉽게 이를 관리할 수 있는 async, await 문법을 공부하였습니다.
- 이를 적용하여서 문제를 해결하였습니다.

<br>

2) 정해진 도시의 순서대로 날씨 정보가 오지 않는 문제
- 비동기적 통신이기 때문에 도착한 순서로 와서 원하는 도시의 순서대로 정렬되지 않았습니다.
- 도시의 한글 순서대로인데, 서버에서 이를 제공하지 않아서 직접 정렬해야겠다고 생각하였습니다.
- weatherEntity를 NetworkService로 부터 받을 때, 사전을 거쳐서 해당 한글 값을 저장 시키고 weatherList에 저장하였습니다.
- 그 후, 20개의 날씨 정보가 도착한 후, 해당 한글 값으로 정렬을 시켜서 순서대로 보여줄 수 있게 되었습니다.

## 실행 영상

https://user-images.githubusercontent.com/61138164/188549867-29a9e1aa-c04f-45bf-b8da-6e5d3c1cf858.mov


