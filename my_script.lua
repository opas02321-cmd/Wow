-- ============================================================
-- 🚩 국기 맞추기 자동 풀이 (WindUI) v5 - 딜레이 조절 & 인간 위장
-- ============================================================
if not game:IsLoaded() then game.Loaded:Wait() end
if getgenv().FlagQuizLoaded then return end
getgenv().FlagQuizLoaded = true

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LP = Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

-- WindUI 로드
local Wind = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
print("[FlagQuiz] WindUI Loaded")

-- ============================================================
-- 1. 국가 사전 (300+ 매핑 데이터 - 위와 동일)
-- ============================================================
local countries = {
    -- [아시아 및 중동]
    ["South Korea"] = "대한민국", ["Korea"] = "대한민국", ["Republic of Korea"] = "대한민국", ["대한민국"] = "South Korea", ["한국"] = "South Korea", ["KR"] = "대한민국",
    ["North Korea"] = "북한", ["DPRK"] = "북한", ["북한"] = "North Korea", ["조선"] = "북한",
    ["Japan"] = "일본", ["일본"] = "Japan", ["JP"] = "일본",
    ["China"] = "중국", ["PRC"] = "중국", ["중국"] = "China", ["CN"] = "중국",
    ["Taiwan"] = "대만", ["대만"] = "Taiwan", ["중화민국"] = "대만",
    ["Hong Kong"] = "홍콩", ["홍콩"] = "Hong Kong",
    ["Macau"] = "마카오", ["Macao"] = "마카오", ["마카오"] = "Macau",
    ["Mongolia"] = "몽골", ["몽골"] = "Mongolia",
    ["Vietnam"] = "베트남", ["Viet Nam"] = "베트남", ["베트남"] = "Vietnam",
    ["Thailand"] = "태국", ["태국"] = "Thailand",
    ["Philippines"] = "필리핀", ["필리핀"] = "Philippines",
    ["Indonesia"] = "인도네시아", ["인도네시아"] = "Indonesia",
    ["Malaysia"] = "말레이시아", ["말레이시아"] = "Malaysia",
    ["Singapore"] = "싱가포르", ["싱가포르"] = "Singapore",
    ["Cambodia"] = "캄보디아", ["캄보디아"] = "Cambodia",
    ["Laos"] = "라오스", ["라오스"] = "Laos",
    ["Myanmar"] = "미얀마", ["Burma"] = "미얀마", ["미얀마"] = "Myanmar",
    ["Brunei"] = "브루나이", ["브루나이"] = "Brunei",
    ["Timor-Leste"] = "동티모르", ["East Timor"] = "동티모르", ["동티모르"] = "Timor-Leste",
    ["India"] = "인도", ["인도"] = "India", ["IN"] = "인도",
    ["Pakistan"] = "파키스탄", ["파키스탄"] = "Pakistan",
    ["Bangladesh"] = "방글라데시", ["방글라데시"] = "Bangladesh",
    ["Sri Lanka"] = "스리랑카", ["스리랑카"] = "Sri Lanka",
    ["Nepal"] = "네팔", ["네팔"] = "Nepal",
    ["Bhutan"] = "부탄", ["부탄"] = "Bhutan",
    ["Maldives"] = "몰디브", ["몰디브"] = "Maldives",
    ["Afghanistan"] = "아프가니스탄", ["아프가니스탄"] = "Afghanistan",
    ["Kazakhstan"] = "카자흐스탄", ["카자흐스탄"] = "Kazakhstan",
    ["Uzbekistan"] = "우즈베키스탄", ["우즈베키스탄"] = "Uzbekistan",
    ["Turkmenistan"] = "투르크메니스탄", ["투르크메니스탄"] = "Turkmenistan",
    ["Kyrgyzstan"] = "키르기스스탄", ["키르기스스탄"] = "Kyrgyzstan",
    ["Tajikistan"] = "타지키스탄", ["타지키스탄"] = "Tajikistan",
    ["Iran"] = "이란", ["이란"] = "Iran", ["IR"] = "이란",
    ["Iraq"] = "이라크", ["이라크"] = "Iraq",
    ["Syria"] = "시리아", ["시리아"] = "Syria",
    ["Lebanon"] = "레바논", ["레바논"] = "Lebanon",
    ["Jordan"] = "요르단", ["요르단"] = "Jordan",
    ["Saudi Arabia"] = "사우디아라비아", ["Saudi"] = "사우디아라비아", ["사우디"] = "Saudi Arabia", ["사우디아라비아"] = "Saudi Arabia",
    ["Yemen"] = "예멘", ["예멘"] = "Yemen",
    ["Oman"] = "오만", ["오만"] = "Oman",
    ["United Arab Emirates"] = "아랍에미리트", ["UAE"] = "아랍에미리트", ["아랍에미리트"] = "UAE",
    ["Qatar"] = "카타르", ["카타르"] = "Qatar",
    ["Bahrain"] = "바레인", ["바레인"] = "Bahrain",
    ["Kuwait"] = "쿠웨이트", ["쿠웨이트"] = "Kuwait",
    ["Israel"] = "이스라엘", ["이스라엘"] = "Israel",
    ["Palestine"] = "팔레스타인", ["팔레스타인"] = "Palestine",
    ["Turkey"] = "터키", ["Türkiye"] = "터키", ["터키"] = "Turkey",

    -- [유럽]
    ["United Kingdom"] = "영국", ["UK"] = "영국", ["Great Britain"] = "영국", ["England"] = "영국", ["Britain"] = "영국", ["영국"] = "United Kingdom",
    ["France"] = "프랑스", ["프랑스"] = "France", ["FR"] = "프랑스",
    ["Germany"] = "독일", ["독일"] = "Germany", ["DE"] = "독일",
    ["Italy"] = "이탈리아", ["이탈리아"] = "Italy",
    ["Spain"] = "스페인", ["스페인"] = "Spain",
    ["Portugal"] = "포르투갈", ["포르투갈"] = "Portugal",
    ["Netherlands"] = "네덜란드", ["Holland"] = "네덜란드", ["네덜란드"] = "Netherlands",
    ["Belgium"] = "벨기에", ["벨기에"] = "Belgium",
    ["Switzerland"] = "스위스", ["스위스"] = "Switzerland",
    ["Austria"] = "오스트리아", ["오스트리아"] = "Austria",
    ["Sweden"] = "스웨덴", ["스웨덴"] = "Sweden",
    ["Norway"] = "노르웨이", ["노르웨이"] = "Norway",
    ["Denmark"] = "덴마크", ["덴마크"] = "Denmark",
    ["Finland"] = "핀란드", ["핀란드"] = "Finland",
    ["Iceland"] = "아이슬란드", ["아이슬란드"] = "Iceland",
    ["Ireland"] = "아일랜드", ["아일랜드"] = "Ireland",
    ["Poland"] = "폴란드", ["폴란드"] = "Poland",
    ["Czech Republic"] = "체코", ["Czechia"] = "체코", ["체코"] = "Czech Republic",
    ["Slovakia"] = "슬로바키아", ["슬로바키아"] = "Slovakia",
    ["Hungary"] = "헝가리", ["헝가리"] = "Hungary",
    ["Romania"] = "루마니아", ["루마니아"] = "Romania",
    ["Bulgaria"] = "불가리아", ["불가리아"] = "Bulgaria",
    ["Greece"] = "그리스", ["그리스"] = "Greece",
    ["Croatia"] = "크로아티아", ["크로아티아"] = "Croatia",
    ["Serbia"] = "세르비아", ["세르비아"] = "Serbia",
    ["Slovenia"] = "슬로베니아", ["슬로베니아"] = "Slovenia",
    ["Bosnia and Herzegovina"] = "보스니아 헤르체고비나", ["Bosnia"] = "보스니아 헤르체고비나", ["보스니아"] = "Bosnia and Herzegovina", ["보스니아 헤르체고비나"] = "Bosnia",
    ["Montenegro"] = "몬테네그로", ["몬테네그로"] = "Montenegro",
    ["North Macedonia"] = "북마케도니아", ["Macedonia"] = "북마케도니아", ["북마케도니아"] = "North Macedonia",
    ["Albania"] = "알바니아", ["알바니아"] = "Albania",
    ["Ukraine"] = "우크라이나", ["우크라이나"] = "Ukraine",
    ["Belarus"] = "벨라루스", ["벨라루스"] = "Belarus",
    ["Russia"] = "러시아", ["Russian Federation"] = "러시아", ["러시아"] = "Russia",
    ["Lithuania"] = "리투아니아", ["리투아니아"] = "Lithuania",
    ["Latvia"] = "라트비아", ["라트비아"] = "Latvia",
    ["Estonia"] = "에스토니아", ["에스토니아"] = "Estonia",
    ["Moldova"] = "몰도바", ["몰도바"] = "Moldova",
    ["Georgia"] = "조지아", ["조지아"] = "Georgia",
    ["Armenia"] = "아르메니아", ["아르메니아"] = "Armenia",
    ["Azerbaijan"] = "아제르바이잔", ["아제르바이잔"] = "Azerbaijan",
    ["Malta"] = "몰타", ["몰타"] = "Malta",
    ["Cyprus"] = "키프로스", ["키프로스"] = "Cyprus",
    ["Luxembourg"] = "룩셈부르크", ["룩셈부르크"] = "Luxembourg",
    ["Andorra"] = "안도라", ["안도라"] = "Andorra",
    ["Monaco"] = "모나코", ["모나코"] = "Monaco",
    ["San Marino"] = "산마리노", ["산마리노"] = "San Marino",
    ["Liechtenstein"] = "리히텐슈타인", ["리히텐슈타인"] = "Liechtenstein",
    ["Vatican City"] = "바티칸", ["Vatican"] = "바티칸", ["바티칸"] = "Vatican City",
    ["Kosovo"] = "코소보", ["코소보"] = "Kosovo",
    ["Isle of Man"] = "맨섬", ["맨섬"] = "Isle of Man",
    ["Jersey"] = "저지 섬", ["저지"] = "Jersey",
    ["Guernsey"] = "건지 섬", ["건지"] = "Guernsey",
    ["Faroe Islands"] = "페로 제도", ["페로제도"] = "Faroe Islands",
    ["Gibraltar"] = "지브롤터", ["지브롤터"] = "Gibraltar",

    -- [아프리카]
    ["Egypt"] = "이집트", ["이집트"] = "Egypt",
    ["South Africa"] = "남아프리카공화국", ["남아공"] = "South Africa", ["남아프리카공화국"] = "South Africa",
    ["Nigeria"] = "나이지리아", ["나이지리아"] = "Nigeria",
    ["Kenya"] = "케냐", ["케냐"] = "Kenya",
    ["Ethiopia"] = "에티오피아", ["에티오피아"] = "Ethiopia",
    ["Ghana"] = "가나", ["가나"] = "Ghana",
    ["Morocco"] = "모로코", ["모로코"] = "Morocco",
    ["Algeria"] = "알제리", ["알제리"] = "Algeria",
    ["Tunisia"] = "튀니지", ["튀니지"] = "Tunisia",
    ["Libya"] = "리비아", ["리비아"] = "Libya",
    ["Sudan"] = "수단", ["수단"] = "Sudan",
    ["South Sudan"] = "남수단", ["남수단"] = "South Sudan",
    ["Senegal"] = "세네갈", ["세네갈"] = "Senegal",
    ["Mali"] = "말리", ["말리"] = "Mali",
    ["Guinea"] = "기니", ["기니"] = "Guinea",
    ["Guinea-Bissau"] = "기니비사우", ["기니비사우"] = "Guinea-Bissau",
    ["Equatorial Guinea"] = "적도 기니", ["적도기니"] = "Equatorial Guinea",
    ["Ivory Coast"] = "코트디부아르", ["Côte d'Ivoire"] = "코트디부아르", ["Cote d'Ivoire"] = "코트디부아르", ["코트디부아르"] = "Ivory Coast",
    ["Cameroon"] = "카메룬", ["카메룬"] = "Cameroon",
    ["Uganda"] = "우간다", ["우간다"] = "Uganda",
    ["Tanzania"] = "탄자니아", ["탄자니아"] = "Tanzania",
    ["Angola"] = "앙골라", ["앙골라"] = "Angola",
    ["Mozambique"] = "모잠비크", ["모잠비크"] = "Mozambique",
    ["Zimbabwe"] = "짐바브웨", ["짐바브웨"] = "Zimbabwe",
    ["Zambia"] = "잠비아", ["잠비아"] = "Zambia",
    ["Namibia"] = "나미비아", ["나미비아"] = "Namibia",
    ["Botswana"] = "보츠와나", ["보츠와나"] = "Botswana",
    ["Madagascar"] = "마다가스카르", ["마다가스카르"] = "Madagascar",
    ["Mauritius"] = "모리셔스", ["모리셔스"] = "Mauritius",
    ["Seychelles"] = "세이셸", ["세이셸"] = "Seychelles",
    ["Rwanda"] = "르완다", ["르완다"] = "Rwanda",
    ["Chad"] = "차드", ["차드"] = "Chad",
    ["Central African Republic"] = "중앙아프리카공화국", ["중앙아프리카"] = "Central African Republic", ["중앙아프리카공화국"] = "Central African Republic",
    ["Democratic Republic of the Congo"] = "콩고민주공화국", ["DR Congo"] = "콩고민주공화국", ["민주콩고"] = "Democratic Republic of the Congo", ["콩고민주공화국"] = "DR Congo",
    ["Republic of the Congo"] = "콩고 공화국", ["Congo"] = "콩고", ["콩고"] = "Congo",
    ["Gabon"] = "가봉", ["가봉"] = "Gabon",
    ["Eswatini"] = "에스와티니", ["Swaziland"] = "에스와티니", ["에스와티니"] = "Eswatini",
    ["Lesotho"] = "레소토", ["레소토"] = "Lesotho",
    ["Comoros"] = "코모로", ["코모로"] = "Comoros",
    ["Somalia"] = "소말리아", ["소말리아"] = "Somalia",
    ["Somaliland"] = "소말릴란드", ["소말릴란드"] = "Somaliland",
    ["Eritrea"] = "에리트레아", ["에리트레아"] = "Eritrea",
    ["Djibouti"] = "지부티", ["지부티"] = "Djibouti",
    ["Mauritania"] = "모리타니", ["모리타니"] = "Mauritania",
    ["Gambia"] = "감비아", ["감비아"] = "Gambia",
    ["Sierra Leone"] = "시에라리온", ["시에라리온"] = "Sierra Leone",
    ["Liberia"] = "라이베리아", ["라이베리아"] = "Liberia",
    ["Togo"] = "토고", ["토고"] = "Togo",
    ["Benin"] = "베냉", ["베냉"] = "Benin",
    ["Burkina Faso"] = "부르키나파소", ["부르키나파소"] = "Burkina Faso",
    ["Niger"] = "니제르", ["니제르"] = "Niger",
    ["Cape Verde"] = "카보베르데", ["카보베르데"] = "Cape Verde",
    ["São Tomé and Príncipe"] = "상투메 프린시페", ["Sao Tome"] = "상투메 프린시페", ["상투메 프린시페"] = "São Tomé and Príncipe",
    ["Western Sahara"] = "서사하라", ["서사하라"] = "Western Sahara",
    ["Saint Helena"] = "세인트헬레나", ["세인트헬레나"] = "Saint Helena",
    ["Réunion"] = "레위니옹", ["Reunion"] = "레위니옹", ["레위니옹"] = "Réunion",

    -- [북아메리카 / 중앙아메리카 / 카리브해]
    ["USA"] = "미국", ["United States"] = "미국", ["America"] = "미국", ["United States of America"] = "미국", ["US"] = "미국", ["미국"] = "USA",
    ["Canada"] = "캐나다", ["캐나다"] = "Canada",
    ["Mexico"] = "멕시코", ["멕시코"] = "Mexico",
    ["Cuba"] = "쿠바", ["쿠바"] = "Cuba",
    ["Jamaica"] = "자메이카", ["자메이카"] = "Jamaica",
    ["Haiti"] = "아이티", ["아이티"] = "Haiti",
    ["Dominican Republic"] = "도미니카 공화국", ["도미니카공화국"] = "Dominican Republic",
    ["Guatemala"] = "과테말라", ["과테말라"] = "Guatemala",
    ["Honduras"] = "온두라스", ["온두라스"] = "Honduras",
    ["El Salvador"] = "엘살바도르", ["엘살바도르"] = "El Salvador",
    ["Nicaragua"] = "니카라과", ["니카라과"] = "Nicaragua",
    ["Costa Rica"] = "코스타리카", ["코스타리카"] = "Costa Rica",
    ["Panama"] = "파나마", ["파나마"] = "Panama",
    ["Bahamas"] = "바하마", ["바하마"] = "Bahamas",
    ["Trinidad and Tobago"] = "트리니다드 토바고", ["트리니다드토바고"] = "Trinidad and Tobago",
    ["Barbados"] = "바베이도스", ["바베이도스"] = "Barbados",
    ["Belize"] = "벨리즈", ["벨리즈"] = "Belize",
    ["Antigua and Barbuda"] = "앤티가 바부다", ["앤티가바부다"] = "Antigua and Barbuda",
    ["Saint Lucia"] = "세인트루시아", ["세인트루시아"] = "Saint Lucia",
    ["Grenada"] = "그레나다", ["그레나다"] = "Grenada",
    ["Saint Vincent and the Grenadines"] = "세인트빈센트 그레나딘", ["세인트빈센트"] = "Saint Vincent and the Grenadines", ["세인트빈센트그레나딘"] = "Saint Vincent",
    ["Dominica"] = "도미니카 연방", ["도미니카연방"] = "Dominica",
    ["Saint Kitts and Nevis"] = "세인트키츠 네비스", ["세인트키츠네비스"] = "Saint Kitts and Nevis",
    ["Puerto Rico"] = "푸에르토리코", ["푸에르토리코"] = "Puerto Rico",
    ["Greenland"] = "그린란드", ["그린란드"] = "Greenland",
    ["Bermuda"] = "버뮤다", ["버뮤다"] = "Bermuda",
    ["Cayman Islands"] = "케이맨 제도", ["케이맨제도"] = "Cayman Islands",
    ["Falkland Islands"] = "포클랜드 제도", ["포클랜드"] = "Falkland Islands",
    ["Aruba"] = "아루바", ["아루바"] = "Aruba",
    ["Curaçao"] = "퀴라소", ["Curacao"] = "퀴라소", ["퀴라소"] = "Curaçao",
    ["Bonaire"] = "보네르", ["보네르"] = "Bonaire",

    -- [남아메리카]
    ["Brazil"] = "브라질", ["브라질"] = "Brazil", ["BR"] = "브라질",
    ["Argentina"] = "아르헨티나", ["아르헨티나"] = "Argentina",
    ["Chile"] = "칠레", ["칠레"] = "Chile",
    ["Colombia"] = "콜롬비아", ["콜롬비아"] = "Colombia",
    ["Peru"] = "페루", ["페루"] = "Peru",
    ["Venezuela"] = "베네수엘라", ["베네수엘라"] = "Venezuela",
    ["Ecuador"] = "에콰도르", ["에콰도르"] = "Ecuador",
    ["Bolivia"] = "볼리비아", ["볼리비아"] = "Bolivia",
    ["Paraguay"] = "파라과이", ["파라과이"] = "Paraguay",
    ["Uruguay"] = "우루과이", ["우루과이"] = "Uruguay",
    ["Guyana"] = "가이아나", ["가이아나"] = "Guyana",
    ["Suriname"] = "수리남", ["수리남"] = "Suriname",
    ["French Guiana"] = "프랑스령 기아나", ["프랑스령기아나"] = "French Guiana",

    -- [오세아니아]
    ["Australia"] = "호주", ["호주"] = "Australia", ["AU"] = "호주",
    ["New Zealand"] = "뉴질랜드", ["뉴질랜드"] = "New Zealand",
    ["Papua New Guinea"] = "파푸아뉴기니", ["파푸아뉴기니"] = "Papua New Guinea",
    ["Fiji"] = "피지", ["피지"] = "Fiji",
    ["Solomon Islands"] = "솔로몬 제도", ["솔로몬제도"] = "Solomon Islands",
    ["Vanuatu"] = "바누아투", ["바누아투"] = "Vanuatu",
    ["Samoa"] = "사모아", ["사모아"] = "Samoa",
    ["Kiribati"] = "키리바시", ["키리바시"] = "Kiribati",
    ["Micronesia"] = "미크로네시아", ["미크로네시아"] = "Micronesia",
    ["Tonga"] = "통가", ["통가"] = "Tonga",
    ["Marshall Islands"] = "마셜 제도", ["마셜제도"] = "Marshall Islands",
    ["Palau"] = "팔라우", ["팔라우"] = "Palau",
    ["Nauru"] = "나우루", ["나우루"] = "Nauru",
    ["Tuvalu"] = "투발루", ["투발루"] = "Tuvalu",
    ["Cook Islands"] = "쿡 제도", ["쿡제도"] = "Cook Islands",
    ["Niue"] = "니우에", ["니우에"] = "Niue",
    ["New Caledonia"] = "누벨칼레도니", ["누벨칼레도니"] = "New Caledonia",
    ["French Polynesia"] = "프랑스령 폴리네시아", ["프랑스령폴리네시아"] = "French Polynesia",
    ["Guam"] = "괌", ["괌"] = "Guam",
    ["American Samoa"] = "아메리칸사모아", ["아메리칸사모아"] = "American Samoa"
}

-- ============================================================
-- 2. UI 생성 (WindUI) - 딜레이 조절 슬라이더 추가
-- ============================================================
local Window = Wind:CreateWindow({
    Title = "국기 맞추기 자동 풀이 (v5)",
    Author = "Panda",
    Size = UDim2.fromOffset(380, 300),
    Acrylic = false,
    ScrollBarEnabled = true,
})

local mainTab = Window:Tab({Title = "자동 풀이"})
local debugTab = Window:Tab({Title = "디버그"})

local statusLabel = mainTab:Paragraph({
    Title = "상태",
    Desc = "게임 시작을 기다리는 중...",
})

local autoSolve = false
mainTab:Toggle({
    Title = "자동 정답 클릭",
    Value = false,
    Callback = function(v) autoSolve = v end
})

-- ★ 사람처럼 보이게 하는 딜레이 슬라이더
local clickDelay = 3.5 -- 기본 3.5초
mainTab:Slider({
    Title = "클릭 속도 조절 (초)",
    Desc = "문제를 읽고 정답을 누르기까지 걸리는 시간 (랜덤 오차 포함)",
    Value = {
        Min = 0.5,
        Max = 10,
        Default = 3.5,
    },
    Callback = function(v)
        clickDelay = tonumber(v)
    end
})

debugTab:Button({
    Title = "UI 구조 확인 (콘솔 출력)",
    Callback = function()
        print("==== [FlagQuiz] UI 구조 확인 ====")
        for _, obj in ipairs(PG:GetDescendants()) do
            if obj:IsA("ImageLabel") or obj:IsA("TextButton") or obj:IsA("TextLabel") then
                if obj.Visible and obj.Name ~= "" then
                    print("이름:", obj.Name, "| 타입:", obj.ClassName, "| 텍스트:", obj.Text or "없음")
                    if obj:IsA("ImageLabel") then
                        print("   ㄴ 이미지 ID:", obj.Image)
                    end
                end
            end
        end
        print("=================================")
        Wind:Notify({
            Title = "디버그",
            Content = "UI 구조를 콘솔에 출력했습니다. (F9 키 누르기)",
            Duration = 5
        })
    end
})

-- ============================================================
-- 3. 매칭 및 자동 클릭 로직
-- ============================================================
local lastQuestionFlag = ""

local function clickButton(btn)
    if btn:IsA("TextButton") or btn:IsA("ImageButton") then
        local success = pcall(function()
            local connections = getconnections(btn.MouseButton1Click)
            if #connections > 0 then
                for _, c in pairs(connections) do
                    c:Fire()
                end
            else
                btn:Activate()
            end
        end)
        if not success then
            btn:Activate()
        end
    end
end

local function findFlagAndAnswer()
    local flagObject = nil
    local options = {}

    -- 국기 이미지 찾기
    local maxSize = 0
    for _, obj in ipairs(PG:GetDescendants()) do
        if obj:IsA("ImageLabel") and obj.Visible and obj.Image ~= "" then
            if obj.AbsoluteSize.X > 80 and obj.AbsoluteSize.Y > 40 then
                if obj.AbsoluteSize.X * obj.AbsoluteSize.Y > maxSize then
                    maxSize = obj.AbsoluteSize.X * obj.AbsoluteSize.Y
                    flagObject = obj
                end
            end
        end
    end

    -- 보기 버튼 찾기
    for _, obj in ipairs(PG:GetDescendants()) do
        if obj:IsA("TextButton") and obj.Visible and obj.Text ~= "" then
            table.insert(options, obj)
        end
    end

    if flagObject and #options >= 2 then
        local flagName = flagObject.Name
        local flagId = flagObject.Image
        local currentFlagIdentifier = flagName .. "|" .. flagId

        if currentFlagIdentifier == lastQuestionFlag then return end

        statusLabel:SetDesc("국기 인식: " .. flagName .. "\n" .. tostring(clickDelay) .. "초 뒤 클릭...")

        -- 긴 이름 우선 매칭
        local sortedKeys = {}
        for k in pairs(countries) do table.insert(sortedKeys, k) end
        table.sort(sortedKeys, function(a, b) return #a > #b end)

        local detectedCountry = nil
        for _, eng in ipairs(sortedKeys) do
            local kor = countries[eng]
            if flagName:find(eng) or flagName:find(kor) then
                detectedCountry = eng
                break
            end
        end

        local correctBtn = nil
        if detectedCountry then
            local korName = countries[detectedCountry]
            for _, btn in ipairs(options) do
                local btnText = btn.Text
                if btnText:find(korName) or btnText:find(detectedCountry) then
                    correctBtn = btn
                    break
                end
            end
        end

        -- 백업 로직 (Value 값 검색)
        if not correctBtn then
            for _, obj in ipairs(PG:GetDescendants()) do
                if obj:IsA("StringValue") or obj:IsA("IntValue") then
                    local val = tostring(obj.Value)
                    for _, btn in ipairs(options) do
                        if btn.Text:find(val) then
                            correctBtn = btn
                            break
                        end
                    end
                end
            end
        end

        if correctBtn then
            lastQuestionFlag = currentFlagIdentifier
            statusLabel:SetDesc("정답: " .. correctBtn.Text .. "\n대기 중...")
            
            if autoSolve then
                -- ★ 딜레이 + 랜덤 오차(0.7배 ~ 1.3배)를 주어 기계처럼 보이지 않게 함
                task.spawn(function()
                    local randomDelay = clickDelay * (0.7 + math.random() * 0.6)
                    task.wait(randomDelay)
                    
                    -- 대기하는 동안 문제가 안 바뀌었는지 확인
                    if lastQuestionFlag == currentFlagIdentifier and autoSolve then
                        clickButton(correctBtn)
                        statusLabel:SetDesc("자동 클릭 완료: " .. correctBtn.Text .. " (" .. string.format("%.1f", randomDelay) .. "초 소요)")
                    end
                end)
            end
        else
            statusLabel:SetDesc("정답을 찾지 못했습니다.\n디버그 탭을 확인하세요.")
        end
    end
end

-- 0.2초마다 화면 스캔 (스캔 주기와 클릭 딜레이는 별개)
task.spawn(function()
    while task.wait(0.2) do
        pcall(findFlagAndAnswer)
    end
end)

print("[FlagQuiz] v5 로드 완료 - 딜레이 슬라이더 및 인간 위장 로직 적용.")