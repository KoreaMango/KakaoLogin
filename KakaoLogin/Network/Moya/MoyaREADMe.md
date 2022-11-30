# Moya Network 설계 주요 4가지 파일
1. NetworkLoggerPlugin: 네트워크 통신 시 MoyaProvider라는 객체를 통해 접근하는데, MoyaProvider의 파라미터 값으로 plugin객체를 넣어주면 해당 plugin기능을 사용 가능
- authPlugin: bearer 토큰 세팅 전용의 플러그인
- LoggerPlugin: response, request 로그를 확인할 수 있는 플러그인
2. Networkable: MoyaProvider 객체를 만들어서 리턴 (Target 타입, plugin 객체를 주입하여 생성)
3. NetworkError: Error프로토콜을 준수하고 있는 에러 정의용도 (response에서 사용)
4. ResponseData: 공통 response에 관하여 Codable로 정의하고 있고, success, failure에 관한 처리를 담당
5. BaseTargetType: Moya에서 제공하는 endpoint에 관해 enum으로 정의하여 편리하게 api호출을 할수 있게 하는 targetType의 base
