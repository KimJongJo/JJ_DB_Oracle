
-- 뮤직 차트 --
CREATE TABLE "MUSIC_BOARD"(
	SONG_NO NUMBER CONSTRAINT SONG_PK PRIMARY KEY,
	SONG_TITLE VARCHAR2(50) NOT NULL,
	SONG_SINGER VARCHAR2(20) NOT NULL,
	SONG_LYRICS VARCHAR2(1500) NOT NULL,
	SONG_LIKE NUMBER NOT NULL,
	SONG_GENRE VARCHAR2(20) NOT NULL,
	SONG_DEL CHAR(1) DEFAULT 'N' CHECK(SONG_DEL IN('Y','N'))
);

-- MUSIC_BOARD 테이블 컬럼 크기 변경

ALTER TABLE "MUSIC_BOARD"
MODIFY SONG_TITLE VARCHAR2(100)
MODIFY SONG_SINGER VARCHAR2(100)
MODIFY SONG_LYRICS VARCHAR2(3000);


COMMENT ON COLUMN "MUSIC_BOARD".SONG_NO IS '노래 번호';
COMMENT ON COLUMN "MUSIC_BOARD".SONG_TITLE IS '노래 제목';
COMMENT ON COLUMN "MUSIC_BOARD".SONG_SINGER IS '노래 가수';
COMMENT ON COLUMN "MUSIC_BOARD".SONG_LYRICS IS '노래 가사';
COMMENT ON COLUMN "MUSIC_BOARD".SONG_LIKE IS '노래 좋아요 수';
COMMENT ON COLUMN "MUSIC_BOARD".SONG_GENRE IS '노래 장르';
COMMENT ON COLUMN "MUSIC_BOARD".SONG_DEL IS '삭제 여부';




-- 재생목록 -- 
CREATE TABLE "PLAYLIST"(
	LIST_NO NUMBER CONSTRAINT LIST_PK PRIMARY KEY,
	SONG_TITLE VARCHAR2(50) NOT NULL,
	SONG_SINGER VARCHAR2(20) NOT NULL,
	SONG_LYRICS VARCHAR2(1500) NOT NULL,
	SONG_LIKE_CH CHAR(1) DEFAULT 'N' CHECK(SONG_LIKE_CH IN('Y','N')),
	LIST_DEL CHAR(1) DEFAULT 'N' CHECK(LIST_DEL IN('Y','N'))
);


-- PLAYLIST테이블에 MEMBER_NO 컬럼 추가
ALTER TABLE PLAYLIST ADD MEMBER_NO NUMBER;


-- PLAYLIST 테이블 컬럼 크기 변경
ALTER TABLE "PLAYLIST"
MODIFY SONG_LYRICS VARCHAR2(3000)
MODIFY SONG_TITLE VARCHAR2(100)
MODIFY SONG_SINGER VARCHAR2(100);



COMMENT ON COLUMN "PLAYLIST".LIST_NO IS '재생목록 번호';
COMMENT ON COLUMN "PLAYLIST".SONG_TITLE IS '노래 제목';
COMMENT ON COLUMN "PLAYLIST".SONG_SINGER IS '노래 가수';
COMMENT ON COLUMN "PLAYLIST".SONG_LYRICS IS '노래 가사';
COMMENT ON COLUMN "PLAYLIST".SONG_LIKE_CH IS '좋아요 체크 여부';
COMMENT ON COLUMN "PLAYLIST".LIST_DEL IS '재생목록 삭제 여부';







-- 회원 목록
CREATE TABLE "MEMBER" (
	MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY,
	MEMBER_ID VARCHAR(20) UNIQUE,
	MEMBER_PW VARCHAR(20) NOT NULL,
	MEMBER_NICKNAME VARCHAR(10) NOT NULL,
	MEMBER_DEL CHAR(1) DEFAULT 'N' CHECK(MEMBER_DEL IN ('Y','N'))
);


-- MEMBER 테이블 컬럼 크기 변경
ALTER TABLE "MEMBER"
MODIFY MEMBER_NICKNAME VARCHAR2(50);



COMMENT ON COLUMN "MEMBER".MEMBER_NO IS '회원 번호';
COMMENT ON COLUMN "MEMBER".MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN "MEMBER".MEMBER_PW IS '회원 비밀번호';
COMMENT ON COLUMN "MEMBER".MEMBER_NICKNAME IS '회원 이름';
COMMENT ON COLUMN "MEMBER".MEMBER_DEL IS '탈퇴 여부';






-- SEQUENCE 생성
CREATE SEQUENCE SEQ_SONG_NO NOCACHE;
CREATE SEQUENCE SEQ_LIST_NO NOCACHE;
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;




INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL ,'나는 아픈 건 딱 질색이니까', '(여자)아이들',
'오늘도 아침엔 입에 빵을 물고
똑같이 하루를 시작하고
온종일 한 손엔 아이스 아메리카노
피곤해 죽겠네

지하철 속 이 장면 어제 꿈에서 봤나
아참 매일이지 지나치고
바쁜 이 삶에 그냥 흔한 날에
그 애를 보고 말야

평온했던 하늘이 무너지고
어둡던 눈앞이 붉어지며
뭔가 잊고 온 게 있는 것 같아
괜히 이상하게 막 울 것만 같고
그냥 지나치는 게 나을 것 같아
나는 생각은 딱 질색이니까

카페인으로 잡은 정신은 빠졌고
하루 종일 신경 쓰여 토할 것 같아
저녁이 돼도 배고픔까지 까먹고
그치 이상하지 근데 말야 있잖아

처음 본 순간 뭐라 할까 그립달까
나도 웃긴데 말야

평온했던 하늘이 무너지고
어둡던 눈앞이 붉어지며
뭔가 잊고 온 게 있는 것 같아
괜히 이상하게 막 울 것만 같고
그냥 지나치는 게 나을 것 같아
나는 생각은 딱 질색이니까

오랫동안 나를 아는
슬픈 표정을 하고 Oh
흔적 없는 기억 밖
혹 과거에 미래에 딴 차원에 세계에
1 2 3 4 5 6 7 8

평온했던 하늘이 무너지고
어둡던 눈앞이 붉어져도
다시 놓쳐버리는 것만 같아
괜히 이상하게 막 울 것만 같고
그냥 지나치는 게 나을 것 같아
나는 생각은 딱 질색이니까

아냐 지나치는 게 나을 것 같아
나는 아픈 건 딱 질색이니까', 89338, '댄스', DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL, '첫 만남은 계획대로 되지 않아', 'TWS(투어스)',
'Ay ay ay ay ay

거울 속에 내 표정 봐 봐
느낌 So good 기다려온 D-day
연습했던 손든 인사도 그대로 하면 돼
Hairstyle check하고 한 번 Turn around

발걸음은 매일 걷던 그 길로
계획은 완벽
빨리 말 걸어보고 싶어, Hey

Woo 문 앞에서 셋을 세어본다, Yeh

(셋, 둘, 하나)

첫 만남은 너무 어려워
계획대로 되는 게 없어서
첫 만남은 너무 어려워
내 이름은 말야

Hey,
안녕, 첫 마디를 건넬 때
주변 소린 Canceled
네 말소리는 Playlist

Yeh,
질문은 나의 용기, 알려줘 너의
“이름이 뭐야?”

너와 내 거리는 세 걸음 남았어, Yeh

(셋, 둘, 하나)

첫 만남은 너무 어려워
계획대로 되는 게 없어서
첫 만남은 너무 어려워
내 이름은 말야

이 순간, Feels so wonderful
조금은 뚝딱거려도
어색한 인사까지도
너와 나의 첫 만남

우리의 사이 Beautiful
내일도 내일모레도
기억해, 영원히 반짝일 순간

Wait wait!

Na na na-

이렇게 만나서 반가워
내일 또 봐 안녕', 98773, '하이브리드 팝', DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'밤양갱', '비비(BIBI)',
'떠나는 길에 니가 내게 말했지
‘너는 바라는 게 너무나 많아
잠깐이라도 널 안 바라보면
머리에 불이 나버린다니까’
나는 흐르려는 눈물을 참고
하려던 얘길 어렵게 누르고
‘그래 미안해’라는 한 마디로
너랑 나눈 날들 마무리했었지

달디달고 달디달고 달디단 밤양갱 밤양갱
내가 먹고 싶었던 건 달디단 밤양갱 밤양갱이야

떠나는 길에 니가 내게 말했지
‘너는 바라는 게 너무나 많아’
아냐 내가 늘 바란 건 하나야
한 개뿐이야 달디단 밤양갱

달디달고 달디달고 달디단 밤양갱 밤양갱
내가 먹고 싶었던 건 달디단 밤양갱 밤양갱이야

상다리가 부러지고
둘이서 먹다 하나가 쓰러져버려도
나라는 사람을 몰랐던 넌

떠나가다가 돌아서서 말했지
‘너는 바라는 게 너무나 많아’
아냐 내가 늘 바란 건 하나야
한 개뿐이야 달디단 밤양갱', 122194, '알앤비/어반', DEFAULT);





INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'EASY', 'LE SSERAFIM (르세라핌)','다친대도 길을 걸어 kiss me
쉽지 않음 내가 쉽게 easy
Stage 위엔 불이 튀어, 내 body
Pull up and I rip it up like ballet

Damn, I really make it look easy
Yuh know that I make it look easy

Clap your hands, 너도 나와 같다면 clap your hands now
의구심 따윈 그냥 치워, 그냥 말해 “I’m the real one”

조명 꺼진 뒤의 난 wander in the night
Don’t know what is right, don’t know ‘bout my rights
시기심, 의심, 불신, 이젠 friends of me, yuh
세상에게 난 반쪽짜리 seraphim, yuh

Uhm I’ve been tryin’ so long to show you show you show you
I’m the one that you need

다친대도 길을 걸어 kiss me
쉽지 않음 내가 쉽게 easy
Stage 위엔 불이 튀어, 내 body
Pull up and I rip it up like ballet

Damn, I really make it look easy
Yuh know that I make it look easy

Yah know that I make it look easy
수면 위의 백조가 돼 whippin’
때론 풀려, 나의 다리 but I keep it
Get, set, go, come and see me, I’m the FEARLESS

나의 발걸음은 매 순간 history, 이건 my way
영웅처럼 걸어 even if I am not flawless
편하게만 왔다고?
날 몰라봤다면 you have to know

Uhm I’ve been tryin’ so long to show you show you show you
I’m the one that you need

다친대도 길을 걸어 kiss me
쉽지 않음 내가 쉽게 easy

Stage 위엔 불이 튀어, 내 body
Pull up and I rip it up like ballet

Damn, I really make it look easy
Yuh know that I make it look easy',60851,'트랩' ,DEFAULT);




INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Love wins all','아이유',
'Dearest, Darling, My universe
날 데려가 줄래?
나의 이 가난한 상상력으론
떠올릴 수 없는 곳으로

저기 멀리 from Earth to Mars
꼭 같이 가줄래?
그곳이 어디든, 오랜 외로움
그 반대말을 찾아서

어떤 실수로
이토록 우리는
함께일까

세상에게서 도망쳐 Run on
나와 저 끝까지 가줘 My lover
나쁜 결말일까 길 잃은 우리 둘 um

부서지도록 나를 꼭 안아
더 사랑히 내게 입 맞춰 Lover
Love is all Love is all
Love Love Love Love

결국, 그럼에도,
어째서 우리는
서로일까

세상에게서 도망쳐 Run on
나와 저 끝까지 가줘 My lover
나쁜 결말일까 길 잃은 우리 둘 um

찬찬히 너를 두 눈에 담아
한 번 더 편안히 웃어주렴

유영하듯 떠오른
그날 그 밤처럼,
나와 함께 겁 없이
저물어줄래?

산산히 나를 더 망쳐 Ruiner
너와 슬퍼지고 싶어 My lover

필연에게서 도망쳐 Run on
나와 저 끝까지 가줘 My lover
일부러 나란히 길 잃은 우리 두 사람

부서지도록 나를 꼭 안아
더 사랑히 내게 입 맞춰 Lover
Our Love wins all Love wins all
Love Love Love Love', 150448,'발라드' ,DEFAULT);




INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'To. X','태연(TAEYEON)',
'처음 본 널 기억해
We skipped the small talk
바로 다음 단계였지 뭐
단점이라곤 없는 게 단점이라던
그 허세도 마냥 좋았어

하지만 내 일기가
재미없어진 이유
내가 없어진 나의
매일들은 허전해

좀 이상해 왜 둘 사이에
너만 너만 보이는 걸까
난 까다롭고 힘든 아이라
그런 피곤한 생각만 한대

오늘 나눈 문자 속에
새로 산 티셔츠
그 얘기뿐이야
이제야 난 알 것 같아
Gonna block you
불을 꺼 To. X

그 좋아했던 립스틱
싫단 말에 버린
널 좋아했던 만큼
다 맞추려 했어

‘나 아님 누가
그런 세상 안아주겠어’
그 말이 그땐 그리
달콤했던 거야 Oh no

새벽의 긴 통화도
이젠 피곤해졌어
Every day, every night
나로 채우고 싶어

좀 이상해 왜 둘 사이에
너만 너만 보이는 걸까
난 까다롭고 힘든 아이라
그런 피곤한 생각만 한대

오늘 나눈 문자 속에
새로 산 티셔츠
그 얘기뿐이야
이제야 난 알 것 같아
Gonna block you
불을 꺼 To. X

Gonna block you
불을 꺼 To. X

Say Bye
Gonna block you
불을 꺼 To. X

깜빡거리는
흔들거리는 Light
Gonna block you
불을 꺼 To. X

좀 이상해 왜 둘 사이에
너만 너만 보이는 걸까
(너만 보일까)
난 까다롭고 힘든 아이라
그런 피곤한 생각만 한대

오늘 나눈 문자 속에
(이제 불을 꺼)
새로 산 티셔츠
그 얘기뿐이야
이제야 난 알 것 같아
Gonna block you
불을 꺼 To. X

Gonna block you
불을 꺼 To. X',137645,'알앤비',DEFAULT);



INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'비의 랩소디','임재현',
'이젠 눈물 그쳐 나를 봐요
우는 그대 더 아름다워
내게 이 모습조차 더 남지 않도록
그냥 고개 돌려요
그저 미안한 마음뿐이죠
그댈 위해 해줄 게 없어
모두 이해할게요 그댈 아끼는 맘
그분들도 같을 거란 걸

한참 동안을 비틀거렸죠
그댈 사랑했던 그만큼
떠나가요 아주 먼 곳으로
그대 소식 내게 올 수 없을 그만큼
다 잊어요 내겐 마지막이 될
사람도 모두 다 버려두고 갈게요

나를 위해 많이 애썼단 걸
알고 있죠 난 감사해요
허나 이룰 수 없는 건 어쩔 수 없죠
내가 용기 낼게요 이젠
죽는 날까지 사랑한대도
가질 수 없는 그대인걸

떠나가요 아주 먼 곳으로
그대 소식 내게 올 수 없을 그만큼
다 잊어요 내겐 마지막이 될
사람도 모두 다 버려두고 갈게요

떠나가요 아주 먼 곳으로
그대 소식 내게 올 수 없을 그만큼
혹시라도 내가 그리울 때면
세상에 내가 없다고 믿어요',62818, '발라드' ,DEFAULT);



INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'천상연','이창섭',
'아니길 바랬었어
꿈이길 기도했지
너 없는 가슴으로 살아가야 하는 건
내게는 너무 힘겨운걸

그렇게 사랑했던
너무도 소중했던
지난날이 서러워 자꾸 눈물이 흘러
내 삶은 너뿐인데

사랑해 널 잊을 순 없을 거야
미안해 너를 지키지 못한 것을
너의 행복한 모습 나 보기를 원해
부디 새롭게 시작하길 바래

하늘이 우리를 갈라 놓지만
눈물로 너를 보내려고 하지만
너를 얼마나 내가 사랑했는 줄 아니
영원히 너를 지켜보며 살 거야
행복하길 바래

그렇게 사랑했던
너무도 소중했던
지난날이 서러워 자꾸 눈물이 흘러
내 삶은 너뿐인데

사랑해 널 잊을 순 없을 거야
미안해 너를 지키지 못한 것을
너의 행복한 모습 나 보기를 원해
부디 새롭게 시작하길 바래

하늘이 우리를 갈라 놓지만
눈물로 너를 보내려고 하지만
너를 얼마나 내가 사랑했는 줄 아니
영원히 너를 지켜보며 살 거야
행복하길 바래

널 사랑해
미안해 너를 지키지 못한 것을
너의 행복한 모습 나 보기를 원해
부디 새롭게 시작하길 바래

행복하길 바래',31354,'발라드' ,DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Smart','LE SSERAFIM (르세라핌)',
'I’m a smarter baby, smarter
Smarter baby, smarter
하날 보면 열까지
간파해서 돌파하지

Wanna be a winner
Wanna be a winner
계획대로 돼가지
난 나비가 될 애송이

원하는 건 승리란 놈
I call it “sugar”
Plan대로라면 놓칠 리가 없지
내 sugar, sugar

누군 말해, 내가 mean-mean-mean-mean-mean
신경 안 써 쉿 쉿 쉿 쉿 쉿
내 패배 위에 필 아름다움 대신
더 강한 이름 "villain"을 택했지

So 그게 바로 me-me-me-me-me
내겐 보여, see-see-see-see-see
르세라핌 날 이끌어 to victory

I’m a smarter baby, smarter
Smarter baby, smarter
하날 보면 열까지
간파해서 돌파하지

Wanna be a winner
Wanna be a winner
계획대로 돼가지
난 나비가 될 애송이
I’m a smarter baby

Work hard in secret
아귀가 착착 맞게
I planned that, don’t be mad

Plan대로라면 난 될 수가 없지
그 loser, loser

누군 말해, 내가 mean-mean-mean-mean-mean
신경 안 써 쉿 쉿 쉿 쉿 쉿
내 패배 위에 필 아름다움 대신
더 강한 이름 "villain"을 택했지

So I just wanna be me-me-me-me
내겐 보여, see-see-see-see-see
르세라핌 날 이끌어 to victory

I’m a smarter baby, smarter
Smarter baby, smarter
하날 보면 열까지
간파해서 돌파하지

Wanna be a winner
Wanna be a winner
계획대로 돼가지
난 나비가 될 애송이
I’m a smarter baby

내 시계는 tick-tock
필요했던 shortcut
찾아내고 난 잡았지, huh

누구는 말해, “that’s all luck”
난 말해, “no, it’s not luck"
내 땀은 not lying, lying

Don’t slow down, 이 삶은 superfast
Best scheme, 내 머릿속에
갓생, 난 준비를 끝냈어

Dinner of the winner,
That is what I want to get

I’m a smarter baby, smarter
Smarter baby, smarter
하날 보면 열까지
간파해서 돌파하지

Wanna be a winner
Wanna be a winner
계획대로 돼가지
난 나비가 될 애송이
I’m a smarter baby',30834,'알앤비/어반',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'홀씨','아이유',
'내가 누울 자린 아마도
한참 더 위로
아니 적당히 미끈한 곳에
뿌리내리긴 싫어

내 뒤로 착착 따라붙어
다 예쁘게 줄지어
난 기어코 하늘에 필래
음, What a tiny leader

아슬아슬히 나는
홀씨 하나 또 다른
길을 향해서
Fly high to bloom
혹시 나의 안부를
묻는 누군가
있거든 전해줘

걔는 홀씨가 됐다구

날 따라, gonna go to win
날 따라, 날아가 꼭대기루
You say 후
I may fly
You say 후
Then i fly

날 따라, Even without wings
날 따라, 떠올라 공중으루
You say 후
I may fly
You say 후
Then i fly

다 날 볼 수 있게 날아 줄게 한가운데
시력을 위해 꼭 지참해 니 sunglass
올려보면 눈부셔
고소공포 하나도 안 무셔

따가운 태양과 무지 가까운 거리
까지 올라가 난 무심히 내려보리
구름을 골라타
간만에 한바탕
싹 어질러볼까

빙글빙그르 나는
홀씨 하나 가파른
바람을 타고
Fly high to bloom
혹시 나의 안부를
묻는 누군가
있거든 전해줘

걔는 홀씨가 됐다구
날 따라, gonna go to win
날 따라, 날아가 꼭대기루
You say 후
I may fly
You say 후
Then i fly

날 따라, Even without wings
날 따라, 떠올라 공중으루
You say 후
I may fly
You say 후
Then i fly

앞길이 만만치 않아도
엄살은 뒤로
내 선택이야 늘 그랬듯이
쉬울 확률은 zero

남은 거 탈탈 털어줄게
모두 행운을 빌어

구태여 인사하고 갈래
May god be with ya
See ya',45437,'랩/힙합',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'그대만 있다면 (여름날 우리 X 너드커넥션 (Nerd Connection))','너드커넥션',
'날 사랑해서 떠난다며
눈물짓던 그대의 말을 믿을 수 없죠
하지만 나의 전부였던
그대가 힘들어하기에 잡을 수 없었죠

온통 너와의 기억뿐인
나를 위해서였다면
조금씩 무너져가는 날
날 위한다면

이대로 내 곁에 있어야 해요
나를 떠나면 안 돼요
세상의 모든 걸 잃어도 괜찮아요
그대만 있다면 그대만 있다면

함께 웃던 시간들을
함께했던 약속들을
지금 또 영원히 기억하겠어요
다시 한번 생각해요
무엇이 날 위한 건지
그대는 알고 있어요

영원히 내 곁을 지켜주세요
나를 떠나지 말아요
세상의 모든 걸 잃어도 난 좋아요
그대만 있다면 그대만 있다면

온통 그대의 생각뿐인
나를 위해서였다면
초라하게 쓰러지는 날
날 위한다면

이대로 내 곁에 있어야 해요
나를 떠나면 안 돼요
세상의 모든 걸 잃어도 괜찮아요
그대만 있다면 그대만 있다면

영원히 내 곁을 지켜주세요
나를 떠나지 말아요
세상의 모든 걸 잃어도 난 좋아요
그대만 있다면 그대만 있다면',91680,'발라드',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'예뻤어','DAY6(데이식스)',
'지금 이 말이
우리가 다시
시작하자는 건 아냐
그저 너의
남아있던 기억들이
떠올랐을 뿐이야
정말 하루도 빠짐없이 너는
사랑한다 말해줬었지
잠들기 전에 또
눈 뜨자마자 말해주던 너
생각이 나 말해보는 거야
예뻤어
날 바라봐 주던 그 눈빛
날 불러주던 그 목소리
다 다
그 모든 게 내겐
예뻤어
더 바랄게 없는듯한 느낌
오직 너만이 주던 순간들
다 다
지났지만
넌 너무 예뻤어
너도 이제는
나와의 기억이
추억이 되었을 거야
너에게는
어떤 말을 해도 다
지나간 일일 거야
정말 한번도 빠짐없이 너는
나를 먼저 생각해줬어
아무 일 아니어도
미안해 고마워 해주던 너
생각이 나 말해보는 거야
예뻤어
날 바라봐 주던 그 눈빛
날 불러주던 그 목소리
다 다
그 모든 게 내겐
예뻤어
더 바랄게 없는듯한 느낌
오직 너만이 주던 순간들
다 다
지났지만
넌 너무 예뻤어
아직도 가끔 네 생각이 나
어렵게 전화를 걸어볼까
생각이 들 때도 많지만
Baby I know it''s already over
아무리 원해도 너는 이제
이미 끝나버린 지난날의
한편의 영화였었단 걸
난 알아
마지막
날 바라봐 주던 그 눈빛
잘 지내라던 그 목소리
다 다
그마저도 내겐
예뻤어
내게 보여준 눈물까지
너와 가졌던 순간들은
다 다
지났지만
넌 너무 예뻤어',289731,'락',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Love 119','RIIZE',
'1 2 Let’s go

뺏긴 My heart
that girl’s a killer
Love so good
feels like a thriller
시작됐지
이건 Emergency (Vroom)
1-1-9 1-1-9
Save my life save my life
She sets me free
이건 Emergency (Love)

너는 마치 Flashlight
자꾸만 시선을 뺏겨
많은 사람 속에서
순간 너만 보였어
다들 말하지
Love is so sweet
아직 난 뭔지 모르겠지
Right now

처음 느낀 이상한 떨림
이건 진심 I’m not kidding
친구이기엔 더
Deeper deeper deeper
어쩌면 Love song yah

뺏긴 My heart
that girl’s a killer
Love so good
feels like a thriller
시작됐지
이건 Emergency (Vroom)
1-1-9 1-1-9
Save my life save my life
She sets me free
이건 Emergency (Love)

이상해 나 What do I do
너에 관한 건 뭐라도
신경 쓰여 난 All day
넌 만들어 My day
이 감정은 Someday
난 알고 싶어
귓가에 울린
Love is so sweet
멈출 수 없이
빠져버린 나야

네가 자꾸 궁금해 왜지
말도 안 돼
I’m not kidding
시간이 갈수록
깊어 깊어 깊어져
가는 나잖아

뺏긴 My heart
that girl’s a killer
Love so good
feels like a thriller
시작됐지
이건 Emergency (Vroom)
1-1-9 1-1-9
Save my life save my life
She sets me free
이건 Emergency (Love)

이건 뭘까
You know what I’m talking about
왜 이렇게
나의 맘이 어지러운 걸까
이 모든 게
내가 널 좋아하는 건가
난 그럼 더 이상
끌고 싶지 않아
다른 건
Nothing but
I want it all with you

뺏긴 My heart
that girl’s a killer
Love so good
feels like a thriller
시작됐지
이건 Emergency (Vroom)
1-1-9 1-1-9
Save my life save my life
She sets me free
이건 Emergency (Love)',90389,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Perfect Night','LE SSERAFIM (르세라핌)',
'Me and my girlies
We gon party til its early
Got me feeling otherworldly tonight
Caught in some traffic
But the radio is blasting
Drop a red light and we’ll sing it goodbye
Ooh
By the morning, feel like magic
I got all I need you know nothing else can beat
The way that I feel when I’m dancing with my girls
Perfect energy yeah we flawless yeah we free
There’s no better feeling in the whole wide world
Tonight
I don’t care what’s wrong or right
Don’t start blowing up my line
I’d care at 11:59
But nothing counts after midnight
Come and take a ride with me
I got a credit card and some good company
Some come through
Make the fit real good
Why you still stuck on loading
Waiting on you babe
Ooh
Night to morning, live slow motion
I got all I need you know nothing else can beat
The way that I feel when I’m dancing with my girls
Perfect energy yeah we flawless yeah we free
There’s no better feeling in the whole wide world
Tonight
I don’t care what’s wrong or right
Don’t start blowing up my line
I’d care at 11:59
But nothing counts after midnight
Ooh
By the morning, feel like magic
I got all I need you know nothing else can beat
The way that I feel when I’m dancing with my girls
Perfect energy yeah we flawless yeah we free
There’s no better feeling in the whole wide world
Tonight
I don’t care what’s wrong or right
Don’t start blowing up my line
I’d care at 11:59
Don’t start blowing up my line',112078,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'한 페이지가 될 수 있게','DAY6 (데이식스)',
'솔직히 말할게
많이 기다려 왔어
너도 그랬을 거라 믿어
오늘이 오길
매일같이 달력을 보면서
솔직히 나에게도
지금 이 순간은
꿈만 같아 너와 함께라
오늘을 위해
꽤 많은 걸 준비해 봤어
All about you and I
다른 건 다 제쳐 두고
Now come with me
Take my hand
아름다운 청춘의 한 장
함께 써내려 가자
너와의 추억들로
가득 채울래
Come on
아무 걱정도 하지는 마
나에게 다 맡겨 봐
지금 이 순간이
다시 넘겨볼 수 있는
한 페이지가 될 수 있게
This is our page
Our page
솔직히 말할게
지금이 오기까지
마냥 순탄하진 않았지
오늘이 오길
나도 목 빠져라 기다렸어
솔직히 나보다도
네가 몇 배는 더
힘들었을 거라고 믿어
오늘을 위해
그저 견뎌줘서 고마워
All about you and I
다른 건 다 제쳐 두고
Now come with me
Take my hand
아름다운 청춘의 한 장
함께 써내려 가자
너와의 추억들로
가득 채울래
Come on
아무 걱정도 하지는 마
나에게 다 맡겨 봐
지금 이 순간이
다시 넘겨볼 수 있는
한 페이지가 될 수 있게
Want you to
Come on out and have fun
Want us to
Have the time of our life
Oh
너와의 추억들로
가득 채울래
Come on
아무 걱정도 하지는 마
나에게 다 맡겨 봐
지금 이 순간이
다시 넘겨볼 수 있는
한 페이지가 될 수 있게
This is our page
Our page',252391,'락',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'에피소드','이무진',
'나는 말야
버릇이 하나
있어 그건 매일 잠에 들 시간마다
잘 모아둔 기억 조각들 중
잡히는 걸 집은 후
혼자 조용히 꼬꼬무

이걸 난
궁상이란
이름으로 지었어 고민 고민하다가
아무튼 뭐 오늘은 하필이면
너가 스쳐버려서
우리였을 때로
우리 정말 좋았던 그때로

우리의 에피소드가
찬란하게 막을 연다
배경은 너의 집 앞
첫 데이트가 끝난
둘만의 에피소드가
참 예쁜 얘기로 시작
자작자작 조심스런 대화
그새 늦은 시간

굿바이
좋은 뜻일 뿐인 굿바이
With a happy smile
이게 이 스토리의 서막
눈 내리던 그 밤
겨울 향이 배어서
더 눈부신
우리의 에피소드다

매일이 마지막인 듯이
함께라면 어디든지
사랑이란 걸 끝도 없이
주고받고 나눴어 그치?
서로만 있음 마음이
시릴 날이 없던 우리
넌 오아시스 내겐 마치

근데 있잖아
별 소용없다?
생각만 해도 행복한 순간들은 말야
모른 척해도 결국엔 이건
끝을 봤던 에피소드
점점 점점 점점

우리의 에피소드가
결말에 가까워져가
곧 새드 엔딩이다
크레딧엔 너와 나
둘만의 에피소드가
참 쓸쓸한 끝을 맞아
두 주인공의 서글픈 마지막
결국 건넨 인사

굿바이
너무 아픈 이별의 굿바이
눈물이 뺨을 스쳐
도착한 입가엔 미소
애써 웃고 있어
우린 서로를 보며
첨 같던 미소로 안녕
웃으며 안녕

눈 뜨면 에필로그다
침대에 기대어 혼자
펑펑 울고 있는 나
이 궁상 밖의 난
둘만의 에피소드완
전혀 다른 모습 난 그날
돌아서지 말았어야 했다
널 안았어야 했다

그 밤
눈꽃이 널 덮은 그 밤의
향을 잊음과
함께 잃었던 따스함
춥게 눈을 뜬다
겨울밤이 되어서
맞이한 향이
우리의 에피소드다',64460,'락',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'헤어지자 말해요','박재정',
'헤어지자고 말하려 오늘
너에게 가다가 우리 추억 생각해 봤어
처음 본 네 얼굴
마주친 눈동자
가까스로 본 너의 그 미소들
손을 잡고 늘 걷던 거리에
첫눈을 보다가 문득 고백했던 그 순간
가보고 싶었던 식당
난생처음 준비한 선물
고맙다는 너의 그 눈물들이
바뀔까 봐 두려워
그대 먼저 헤어지자 말해요
나는 사실 그대에게 좋은 사람이 아녜요
그대 이제 날 떠난다 말해요
잠시라도 이 행복을 느껴서 고마웠다고
시간이 지나고 나면 나는
어쩔 수 없을 걸 문득 너의 사진 보겠지
새로 사귄 친구 함께
웃음 띤 네 얼굴 보면
말할 수 없을 묘한 감정들이
힘들단 걸 알지만
그대 먼저 헤어지자 말해요
나는 사실 그대에게 좋은 사람이 아녜요
그대 이제 날 떠난다 말해요
잠시라도 이 행복을 느껴서 고마웠다고
한 번은 널 볼 수 있을까
이기적인 거 나도 잘 알아
그땐 그럴 수밖에 없던
어린 내게 한 번만 더 기회를 주길
그댈 정말 사랑했다 말해요
나는 사실 그대에게
좋은 사람이 되고 싶었어
영영 다신 못 본다 해도
그댈 위한 이 노래가
당신을 영원히 사랑할 테니',167559,'발라드',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Drama','aespa',
'Ya Ya I’m the Drama
Ziggy ziggy zag I’m new
’Cause I go biggie biggie bad It’s true
날카로운 눈 안에 비친 Toxic
내 본능을 당겨 Zoom
Hold up, What? Oh my god
You say, What? 다쳐 넌
You better watch out
우린 이미 거센 Boom
달려가고 있어 Vroom
I li-li like me when I roll
Li-li-like me when I’m savage
Li-li-like me when I go
Li-li-likie when I baddest
Hold up 빛을 따라서
달아 다 다 달려나가 Run
Go Finally Ra ta ta ta
다음 세계를 열어 난
1, 2 It’s time to go
후회 없어 난
맞서 난 깨버렸지
날 따라서 움직일 Rules
손끝으로 세상을 두드려 움직여
Yeah I’m coming
I bring I bring
all the Drama-ma-ma-ma
I bring Drama-ma-ma-ma
With my girls in the back
Girls in the back
Drama
Trauma-ma-ma-ma
I break Trauma-ma-ma-ma
With MY WORLD in the back
나로 시작되는 Drama
(All that)
Drama-ma-ma-ma
(Bring it that)
Drama-ma-ma-ma
With my girls in the back
Girls in the back Yeah
I break
Trauma-ma-ma-ma
(We them)
Trauma-ma-ma-ma
With MY WORLD in the back
나로 시작되는 Drama
Drama-ma-ma-ma
Drama-ma-ma-ma (3, 2, 1)
Drama-ma-ma
You know I’ve been kind of like
1, 2, 3 깜짝 놀랄 다음 Scene
키를 거머쥔
주인공은 나
4, 3, 2 Going down
쉽게 Through
Deja Vu 같이
그려지는 이미지
날 굳이 막지 말아
이건 내 Drama
도발은 굳이 안 막아
Uh I’m a stunner
1, 2 It’s time to go
타오르는 날 (타는 날)
느껴 난 And I love it
새로워지는 Rules
난 눈을 떠 (두 눈을 떠)
시작된 걸 (넌) 알아 (Now)
It’s coming
I bring I bring
all the Drama-ma-ma-ma
I bring Drama-ma-ma-ma
With my girls in the back
Girls in the back
Drama
Trauma-ma-ma-ma
I break Trauma-ma-ma-ma
With MY WORLD in the back
나로 시작되는 Drama
Into the REAL WORLD
다가온 Climax
두려워하지 마
You and I
함께 써 내려가는 Story
날 가로막았던 No
한계를 뛰어 넘어 Every day
Oh Imma make it my way
Out of the way Yeah
I bring I bring
all the Drama-ma-ma-ma
I bring Drama-ma-ma-ma
With my girls in the back
Girls in the back
Drama
Trauma-ma-ma-ma
I break Trauma-ma-ma-ma
With MY WORLD in the back
나와 함께하는 Drama
(All that)
You know, I’m savage
거침없는 Baddest
나를 둘러싼 Thrill
거친 여정 속의 Drama
(Drama-ma-ma)
내가 깨트릴 모든 Trauma
(Drama-ma-ma)
지금 시작되는 Drama
Ya Ya 너로 시작될 MY Drama',83469,'장르',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'인사','범진',
'돌아서는 너를 보며
난 아무 말도 할 수 없었고
슬퍼하기엔 짧았던
나의 해는 저물어 갔네
지나치는 모진 기억이
바람 따라 흩어질 때면
아무 일도 없듯이 보내주려 해
아픈 맘이 남지 않도록
안녕 멀어지는 나의 하루야
빛나지 못한 나의 별들아
차마 아껴왔던 말 이제서야
잘 지내 인사를 보낼 게
떠나가는 너를 보며
난 아무 말도 할 수 없었고
슬퍼하기엔 짧았던
나의 해는 저물어 갔네
돌이킬 순 없는 추억이
바람 따라 흩어질 때면
아무 일도 없듯이 보내주려 해
아픈 맘이 남지 않도록
안녕 멀어지는 나의 하루야
빛나지 못한 나의 별들아
차마 아껴왔던 말 이제서야
잘 지내 인사를 보낼 게
잘 지내 인사를 보낼 게',103702,'발라드',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'사랑은 늘 도망가','임영웅',
'눈물이 난다 이 길을 걸으면
그 사람 손길이 자꾸 생각이 난다
붙잡지 못하고 가슴만 떨었지
내 아름답던 사람아
사랑이란 게 참 쓰린 거더라
잡으려 할수록 더 멀어지더라
이별이란 게 참 쉬운 거더라
내 잊지 못할 사람아
사랑아 왜 도망가
수줍은 아이처럼
행여 놓아버릴까 봐
꼭 움켜쥐지만
그리움이 쫓아 사랑은 늘 도망가
잠시 쉬어가면 좋을 텐데
바람이 분다 옷깃을 세워도
차가운 이별의 눈물이 차올라
잊지 못해서 가슴에 사무친
내 소중했던 사람아
사랑아 왜 도망가
수줍은 아이처럼
행여 놓아버릴까 봐
꼭 움켜쥐지만
그리움이 쫓아 사랑은 늘 도망가
잠시 쉬어가면 좋을 텐데
기다림도 애태움도 다 버려야 하는데
무얼 찾아 이 길을 서성일까
무얼 찾아 여기 있나
사랑아 왜 도망가
수줍은 아이처럼
행여 놓아버릴까 봐
꼭 움켜쥐지만
그리움이 쫓아 사랑은 늘 도망가
잠시 쉬어가면 좋을 텐데
잠시 쉬어가면 좋을 텐데',211378,'드라마음악',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'I AM','IVE (아이브)',
'다른 문을 열어 따라 갈 필요는 없어
넌 너의 길로 난 나의 길로 음
하루하루마다 색이 달라진 느낌
밝게 빛이 나는 길을 찾아
I’m on my way 넌 그냥 믿으면 돼
I’m on my way 보이는 그대로야
너는 누군가의 Dreams come true
제일 좋은 어느 날의 데자뷰
머물고픈 어딘가의 낯선 뷰
I’ll be far away
That’s my
Life is 아름다운 갤럭시
Be a writer, 장르로는 판타지
내일 내게 열리는 건 big big 스테이지
So that is who I am
Look at me
Look at me
Look at me
now
어제랑 또 다른 짜릿한 나
두려운 모든 게 설레이게
I’m in sky high, OMG
사소한 건 다 아득해져 와
Look at me now
Look at me now
I’m on fire
I’m on my way 넌 그냥 믿으면 돼
I’m on my way 보이는 그대로야
너는 누군가의 Dreams come true
제일 좋은 어느 날의 데자뷰
머물고픈 어딘가의 낯선 뷰
I’ll be far away
That’s my
Life is 아름다운 갤럭시
Be a writer, 장르로는 판타지
내일 내게 열리는 건 big big 스테이지
So that is who I am
어느 깊은 밤 길을 잃어도
차라리 날아올라 그럼 네가
지나가는 대로 길이거든
1, 2, 3
1, 2, 3
1, 2, 3
Fly up
I hope you’d be someone’s
dreams come true
제일 좋은 어느 날의 데자뷰
머물고픈 어딘가의 낯선 뷰
I’ll be far away
That’s my
Life is 아름다운 갤럭시
Be a writer, 장르로는 판타지
내일 내게 열리는 건 big big 스테이지
So that is who I am',211852,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Seven (feat. Latto) - Clean Ver.','정국',
'Weight of the world on your shoulders
I kiss your waist and ease your mind
I must be favored to know ya
I take my hands and trace your lines

It’s the way that we can ride
It’s the way that we can ride
Think I met you in another life
So break me off another time

You wrap around me
and you give me life
And that’s why night after night
I’ll be lovin’ you right

Monday Tuesday Wednesday
Thursday Friday Saturday Sunday
Monday Tuesday Wednesday
Thursday Friday
Seven days a week
Every hour every minute every second
You know night after night
I’ll be lovin’ you right
Seven days a week


You love when I jump right in
All of me I’m offering
Show you what devotion is
Deeper than the ocean is
Wind it back I’ll take it slow
Leave you with that afterglow
Show you what devotion is
Deeper than the ocean is

It’s the way that we can ride
It’s the way that we can ride
Think I met you in another life
So break me off another time

You wrap around me
and you give me life
And that’s why night after night
I’ll be lovin’ you right

Monday Tuesday Wednesday
Thursday Friday Saturday Sunday
Monday Tuesday Wednesday
Thursday Friday
Seven days a week
Every hour every minute every second
You know night after night
I’ll be lovin’ you right
Seven days a week

Monday Tuesday Wednesday
Thursday Friday Saturday Sunday
Monday Tuesday Wednesday
Thursday Friday
Seven days a week
Every hour every minute every second
You know night after night
I’ll be lovin’ you right
Seven days a week

Tightly take control
Tightly take his soul
Take your phone
and put it in the camera roll
Leave them clothes at the door
What you waiting for,
better come and hit ya goals
He jump in it both feet
Going to the sun-up,
we ain’t getting no sleep
Seven days a week,
seven different sheets, seven different angles
I can be your fantasy

Open up say ahhh
Come here baby
let me swallow your pride
What you on I can match your vibe
Hit me up and I’mma Cha Cha Slide

You make Mondays feel like weekends
I make him never think about cheatin’
Got you skipping work and meetings,
let’s sleep in

Seven days a week
Monday Tuesday Wednesday
Thursday Friday Saturday Sunday
Monday Tuesday Wednesday
Thursday Friday
Seven days a week
Every hour every minute every second
You know night after night
I’ll be lovin’ you right
Seven days a week

Monday Tuesday Wednesday
Thursday Friday Saturday Sunday
Monday Tuesday Wednesday
Thursday Friday
Seven days a week
Every hour every minute every second
You know night after night
I’ll be lovin’ you right
Seven days a week',206819,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'꿈','태연 (TAEYEON)',
'화려한 도시를
그리며 찾아왔네
그곳은 춥고도 험한 곳
여기저기 헤매다
초라한 문턱에서
뜨거운 눈물을 먹는다

머나먼 길을 찾아 여기에
꿈을 찾아 여기에
괴롭고도 험한 이 길을 왔는데
이 세상 어디가 숲인지
어디가 늪인지
그 누구도 말을 않네

사람들은 저마다
고향을 찾아가네
나는 지금 홀로 남아서
빌딩 속을 헤매다
초라한 골목에서
뜨거운 눈물을 먹는다

저기 저 별은 나의 마음 알까
나의 꿈을 알까
괴로울 땐 슬픈 노래를 부른다
슬퍼질 땐 차라리 나 홀로
눈을 감고 싶어
고향의 향기 들으면서

저기 저 별은 나의 마음 알까
나의 꿈을 알까
괴로울 땐 슬픈 노래를 부른다
이 세상 어디가 숲인지
어디가 늪인지
그 누구도 말을 않네

슬퍼질 땐 차라리 나 홀로
눈을 감고 싶어
고향의 향기 들으면서
고향의 향기 들으면서',33845,'드라마음악',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Super Lady','(여자)아이들',
'I am the top, super lady (Oh)
I never lose yeah
(’Cause got a super power)
I am a god, super lady (Oh)
I NEVER DIE 봤지? 모두 Follow

Boy boy boy 거기 비켜 어서
우린 Love love love 따위 하긴 바빠
여긴 War war war 자비 따윈 없어
날 막는다면 Slay it (Lock it)

남자들의 뻔한 가식 (Drop it)
억 소리 나는 그 사치
영웅은 조금의 흔들릴 틈 없이
Ready to shoot

입술이 다 번져도
그 어떤 놈보다 멋지게
(누구보다 멋지게)
웃어 보이지 더 거칠게
독하다 해 That’s my name
I never bow on my way

Lady lady
Call me ‘Super Lady’
Lady lady

Follow, ladies
Onward, ladies
Super ladies
하나 둘 셋

Mama said 넌 언젠가 세상을 망칠 악
그 겁에 질린 눈빛도 참 못됐으니까

그 눈빛은 패왕색 패기 여왕의 자질 The Baddie
100이면 100이 다 기절한 각성에 겁먹은 Devil
그래 뵈는 게 없거든 Do you know?

불길이 다 번져도
그 어떤 놈보다 멋지게
(누구보다 멋지게)
뛰어들 테지 더 뜨겁게
독하다 해 That’s my name
I never bow on my way

Lady lady
Call me ‘Super Lady’
Lady lady

Follow, ladies
Onward, ladies
Super ladies

Let’s go on fearless
We came to take a win

Back it up (Oh)
Back it up (Oh-oh)
Back it up (Oh)
Back it up
Everybody say

누가 우릴 부른다면 Yes sir, super fast
누가 우릴 막는다면 Yes sir, supernatural
누가 봐도 우린 Yes, stronger than Superman
Yes sir, I got super power
Yes sir, I’m a',32404,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'MANIAC','VIVIZ(비비지)',
'힘껏 내팽개친 Roses
말론 안 통하지 역시 어쩜 이리 안 변해
인정 같은 소린 됐고
이쯤에서 끝내 Let go 인내심도 Out of space

얼룩지는 Red carpet 그렇게 또 Fade away
치워줘 Scarred face 끝까지 신경 쓰여 Huh

This love is maniac maniac maniac
But I can’t killin’ it killin’ it killin’ it
사랑 말고 다른 말론 설명할 수 없는 멜로
It’s maniac maniac maniac

자극적 이끌림 잔인해진 Orbit
지겨운 Love-phobic yeah
그래 솔직하자 넌 지금 즐긴 거야

얼음처럼 날 선 말 부서질 듯 던져 막
심장을 푹 찌르고 또 Melted
완벽하게 Cliche 웃기지도 않는 꼴
갈피 없이 뒤집히는 Magnet

답이 없는 Zero-sum game 뭐가 문제였던 건데
결국 또 미뤄진 End 이것도 재주야 Perfect

This love is maniac maniac maniac
But I can’t killin’ it killin’ it killin’ it
사랑 말고 다른 말론 설명할 수 없는 멜로
It’s maniac maniac

Crystal처럼 조각난 Lighting 그 아래 선 우린
Living in a moment Bloody truth
짓이겨져 물든 Rose 결국 벗어던진 Mask
말해 What you wanna do Woo woo ah

This love is maniac maniac maniac
And I’m okay with it okay with it okay with it
끝내 너와 나마저도 이해할 수 없는 멜로
It’s maniac maniac maniac

화려한 이 Tragic 이거 사랑 맞지
영원할 Scenery yeah
그래 솔직하자 우리는 즐긴 거야

Never ever
It’s coming down It’s coming down
It’s coming down
Maniac
Yeah yeah woo woo woo',50156,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Shopper','아이유',
'아직도 난
더 가지고 싶어
(Yeah I want more
I’ll get it more, more)

설레는 게
이렇게나 많은 걸
(Oh I want all
I must have all, all)

저녁 일곱시
노을의 팔레트
(I need it, course
I’ll take it, course, course)

가슴 터질 듯
내 이름을 외치는 목소리
(Oh it’s so worth
It’s more than what, what)

빼곡히 적은 wish list
빠짐없이 가질 때까지
(Take what you want
No matter who calls you a freak)

설명할 필요 없어
나 그때와는 다른 걸 원해, 원해

Let’s go haul
더 미어터질 만큼 다 채워
Look around
시간은 짧아 더 빨리 가져
(Shop all day, ay
Greed is free, ay)

Go Make your own
가지러 태어난 것처럼
이 샵은 문 닫지 않아 늘, 영원히

마지막 소절 숨의 첫 모금
(It’s time to show
Go, make it sure, sure)

승리를 앞둔
마음이 달릴 때 내는 소리
(It’s time to go
I’ll make my goal, goal)

내게는 없어 plan B
모조리 내 것이 될 때까지
(Take what you want
No matter who puts down your greed)

적당히로는 안돼
난 훨씬 더 대담한 걸 원해, 원해

Let’s go haul
더 미어터질 만큼 다 채워
Look around
시간은 짧아 더 빨리 가져
이 샵은 문 닫지 않아, 봐

필요 없는 건 없어
for my Victory, even your jealousy
나 이제껏 모르던 세상을 욕심 내볼래

Let’s go haul
더 미어터질 만큼 다 채워
Look around
시간은 짧아 더 빨리 가져

Shop all day, ay
Greed is free, ay

Go Make your own
가지러 태어난 것처럼
이 샵은 문 닫지 않아 늘, 영원히',37962,'락',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Smoothie','NCT DREAM',
'Smoothie yes sir umm
Listen

Good boy
이제 더는 없어 I’mma bad
Soft하게 Twist
Give you just a lil’ taste ha
가차 없이 비틀어 논 다음
삼켜 Sip
Watch how I blend it up

가릴 것이 없어
우린 목이 말라 마침
보여줄게
네가 바란 무자비한 방식
Strawberry sweet cinnamon
어서 Pop that corn 터트려봐

You should know what you missin’
수준대로 Guessin’
Freeze like ice
단 한 번에 Crushin’
날것 그대로인 Action
껍질째로 밟아 우선
수도 없이 견딘 상처
위로 들이부어 실컷

끈적하게 날
타고 흘러내린 Trauma
씹어 삼켜 바닥까지
Cuz you’re my
Smoothie

Smoothie Smoothie Smoothie
Smoothie Smoothie Smoothie
다 털어 갈아 넣어
Smoothie Smoothie Smoothie
Smoothie Smoothie Smoothie
Dirty taste 들이켜
Smoothie Smoothie Smoothie
Smoothie Smoothie Smoothie
가볍게 씹어 삼켜
Smoothie Smoothie
Smoothie Smoothie

Sip it sip it down like Smoothie
Sip it sip it down like Smoothie

때려 넣어 Doubt and fake
쏟아부어 모든 Pain
Shower that in all this ice
결국엔 녹아 Fade out
어디 더 던져봐 Stuff
Syrup and sugar like buff
We make it easy
I’m gonna take it all

Ayo Check it huh
재료는 차고 넘쳐
새로 만든 Menu
So delicious vicious
뭐래도 I deserve
I’mma killa huh

What a commotion
튀어 오른 찌꺼긴 옷에 묻어
그냥 버려 난 이미
Don’t need permission
You just watch it

Shakin’ stirrin’ drinkin’ up
(ho! Give us some more)
Hot and spicy Mix it up
Wait stop 입은 다물고 봐
I’m ridin’ that new wave

You should know what you missin’
취향대로 Guessin’
Freeze like ice
더 거칠게 Mess up
(거칠게 Mess up yeah)
훤히 드러나는 Action
배배 꼬여버린 시선
밟아버리는 게 Mission
우린 Special한 Edition

끈적하게 날
뒤덮었던 흉터를 봐
흔적 없이 끝을 내지
Watch me now
Smoothie

Smoothie Smoothie Smoothie
Smoothie Smoothie Smoothie
다 털어 갈아 넣어
Smoothie Smoothie Smoothie
Smoothie Smoothie Smoothie
Dirty taste 들이켜
Smoothie Smoothie Smoothie
Smoothie Smoothie Smoothie
가볍게 씹어 삼켜
Smoothie Smoothie
Smoothie Smoothie

얼마든지 괴로워도 괜찮아
달콤함만 기대한 적 없어 난
모든 고통이
전부 녹아 흐른 뒤 (흘러간 뒤)
다시 채워지는 새로운 나

Sip it down real smooth you know

Smoothie Smoothie Smoothie
Smoothie Smoothie Smoothie
(Sip it down yeah)
다 털어 갈아 넣어
Smoothie Smoothie Smoothie
Smoothie Smoothie Smoothie
(Pour it like Smoothie yeah)
Dirty taste 들이켜
(Dirty taste 들이켜 Smoothie)

Smoothie Smoothie Smoothie
Smoothie Smoothie Smoothie
가볍게 씹어 삼켜
(가볍게 씹어 삼켜 Smoothie yeah)
Smoothie Smoothie
Smoothie Smoothie

끈적하게 날

Sip it sip it down like Smoothie
Sip it sip it down like
Smoothie',29150,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'너의 모든 순간','성시경',
'이윽고 내가 한눈에
너를 알아봤을 때
모든 건 분명 달라지고 있었어
내 세상은 널 알기 전과 후로 나뉘어
니가 숨 쉬면 따스한 바람이 불어와
니가 웃으면 눈부신 햇살이 비춰
거기 있어줘서 그게 너라서
가끔 내 어깨에 가만히 기대주어서
나는 있잖아 정말 빈틈없이 행복해
너를 따라서 시간은 흐르고 멈춰
물끄러미 너를 들여다 보곤 해
그것 말고는 아무것도 할 수 없어서
너의 모든 순간 그게
나였으면 좋겠다
생각만 해도 가슴이 차올라
나는 온통 너로
보고 있으면 왠지 꿈처럼 아득한 것
몇 광년 동안 날 향해 날아온 별빛
또 지금의 너
거기 있어줘서 그게 너라서
가끔 나에게 조용하게 안겨주어서
나는 있잖아 정말 남김없이 고마워
너를 따라서 시간은 흐르고 멈춰
물끄러미 너를 들여다보곤 해
너를 보는 게 나에게는 사랑이니까
너의 모든 순간 그게
나였으면 좋겠다
생각만 해도 가슴이 차올라
나는 온통 너로
니 모든 순간 나였으면',294095,'발라드',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'사랑인가봐','멜로망스',
'너와 함께 하고 싶은 일들을
상상하는 게
요즘 내 일상이 되고
너의 즐거워하는 모습을 보고 있으면
자연스레 따라 웃고 있는 걸
너의 행동에 설레어하고 뒤척이다가
지새운 밤이 많아지는데
이건 누가 봐도 사랑일 텐데
종일 함께면 질릴 텐데
나 돌아서도 온통 너인 건
아무래도 사랑인가 봐
점점 너와 하고 싶은 일들 생각하면서
하룰 보낸 날이 많아지는데
이건 누가 봐도 사랑일 텐데
종일 함께면 질릴 텐데
나 돌아서도 온통 너인 건
아무래도 사랑인가 봐
너의 행복해하는 모습을 보고 있으면
나도 모르게 따라 웃는데
이 정도면 알아줄 만하잖아
너도 용기 낼만 하잖아
나만 이런 게 아니라면
우리 만나볼 만하잖아
아무래도 사랑인가 봐',204709,'드라마음악',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'모래 알갱이','임영웅',
'나는 작은 바람에도 흩어질
나는 가벼운 모래 알갱이
그대 이 모래에 작은 발걸음을 내어요
깊게 패이지 않을 만큼 가볍게
나는 작은 바람에도 흩어질
나는 가벼운 모래 알갱이
그대 이 모래에 작은 발자국을 내어요
깊게 패이지 않을 만큼 가볍게
그대 바람이 불거든
그 바람에 실려 홀연히 따라 걸어가요
그대 파도가 치거든
저 파도에 홀연히 흘러가리
그래요 그대여 내 맘에
언제라도 그런 발자국을 내어줘요
그렇게 편한 숨을 쉬듯이
언제든 내 곁에 쉬어가요
그대 바람이 불거든
그 바람에 실려 홀연히 따라 걸어가요
그대 파도가 치거든
저 파도에 홀연히 흘러가리
그래요 그대여 내 맘에
언제라도 그런 발자국을 내어줘요
그렇게 편한 숨을 쉬듯이
언제든 내 곁에 쉬어가요
언제든 내 맘에 쉬어가요',58801,'발라드',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Wife','(여자)아이들',
'I cook cream soup
Taste is Cocoroco
Want me as your wife but she is
Umm umm umm

I clean your room
It’s so twinkle twinkle
Want me as your wife but she is
Umm umm umm

자기야 한입 크게 맛봐
배가 부르대도 뱉으면 나빠
좀 더 줄 테니 그만 침 좀 닦아
이제 다 큰 거 아니 너네 아빠

그래 그럴 줄 알고 케이크 좀 구웠어
그게 다가 아냐 위에 체리도 따먹어줘
조심스레 키스하고 과감하게 먹어치워
어떤지 맛 표현도 들려 보여줘

I cook cream soup
Taste is Cocoroco
Want me as your wife but she is
Umm umm umm

I clean your room
It’s so twinkle twinkle
Want me as your wife but she is
Umm umm umm

Umm umm umm
It’s a ddub ddub ddub
나의 Tongue 살짝 Touch
너는 Brr brr brr

아 구석구석 깨끗이 닦아놔
섬세한 입술에 손길은 안 닿아
머리부터 발끝까지 그냥 Chop chop chop
배웠으면 이제 너도 한번 올라타봐

만약 잘한다면 멋진 노래도 부르고
물 만난 인어처럼 예쁜 춤도 춰줄 거야
만약에 잘한다면 나도 배도 부르고
기분 좋으니까 깊숙이 더 삼켜버릴 거야

I cook cream soup
Taste is Cocoroco
Want me as your wife but she is
Umm umm umm

I clean your room
It’s so twinkle twinkle
Want me as your wife but she is
Umm umm umm

Wife, I make you feel so high
I make you feel like lie
But I don’t wanna

Wife wife wife wife

Wife, I make you feel so high
I make you feel like lie
But I don’t wanna',31107,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'WAY 4 LUV','PLAVE',
'Way 4 Luv
Way 4 your Luv
Way 4 Luv
Way 4 your Luv
거짓말이라도 믿을게
영화 같은 스토리의 끝에

It’s like a movie
우린 참 어렸었지
저 별들을 닮기엔
모든 게 서툴렀지 Oh yeah

뜨거웠던 숨은 꿈이 되어
내 심장에 불을 지폈어 날 멈출 수 없도록 더욱
떨어져가는 폭포

처럼 내 몸을 던졌어
그 속에 피어난 Flo(wer)

어느새 노을이 지고 있어 그곳으로

Moonlight
끝이 없는 Midnight
Sunshine
반복되는 Highlight

Woo woo woo woo woo woo woo

(Woo woo woo woo woo woo woo)

Woo woo woo woo woo woo woo

(Woo woo woo woo woo woo woo)

Way 4 Luv
Way 4 your Luv
Way 4 Luv
Way 4 your Luv
거짓말이라도 믿을게
영화 같은 스토리의 끝에

Way 4 Luv
uh Way 4 your Luv
사계절이 되어줘 My Venus
거짓말이라도 믿을래
황홀한 이 여정의 끝에

쏟아지는 유성 아래
형 형색의 Rainbow
지나치게 아름다워
A to T, I’m driving now

There’s no rush hour

Let’s go Eiffel Tower

Imagine we smile at the same time

Moonlight
끝이 없는 Midnight
Sunshine
반복되는 Highlight

Woo woo woo woo woo woo woo

(Woo woo woo woo woo woo woo)

Woo woo woo woo woo woo woo

(Woo woo woo woo woo woo woo)

Way 4 Luv
Way 4 your Luv
Way 4 Luv
Way 4 your Luv
거짓말이라도 믿을게
영화 같은 스토리의 끝에

같은 시선 속에 맞닿은 우리야

너와 날 닮은 이 순간

끝나지 않을 여행이라

It’s a beautiful life

Way 4 Luv
oh Way 4 Luv
거짓말이라도 믿을게
영화 같은 스토리의 끝에

Way 4 Luv
uh Way 4 your Luv

사계절이 되어줘 My Venus
거짓말이라도 믿을래
황홀한 이 여정의 끝에

Woo woo woo
woo woo woo
Woo woo woo woo
woo woo woo
Woo woo woo woo',35032,'락',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Love Lee','AKMU (악뮤)',
'You know
내 스타일이 아닌 음악을 들어도
You know
좋아하지 않는 음식을 먹어도
우산 없이 비가 와 홀딱 다 젖어도 좋아
I love it because I love you

우리 관계 디비디비딥
매일 봐도 처음같이 비기비기닝
춤추고 싶어 빌리빌리진
우리 앞 우리 옆 시기시기질투
자유로운 날갯짓 훨훨훨
꽃송이가 나를 삼킬 걸
알면서 난 뛰어들었어
Jump j-j-jump jump jump jump

So lovely day so lovely
Errday with you so lovely
Du durudu durudu du durudu

Spell L.o.v.e.L.e.e
이름만 불러도 you can feel me
눈빛만 봐도 알면서 my love

You know
아끼는 옷에 coffee를 쏟아도
You know
내가 준 목걸이를 잃어버려도
한 번 더 같은 것 사준 걸 다시 또 잃어도 좋아
I don’t care I just care about you

여기 어때 how you like that
다 퍼주고 될게 빈털터리
Jubilate 박수갈채
안 반하고 누가 배겨 love sick
비타민 U가 필요해
만들어줘 샛노랗게
체크무늬 벌집 두 눈에
Honey help honey help

So lovely day so lovely
Errday with you so lovely
Du durudu durudu du durudu

Spell L.o.v.e.L.e.e
이름만 불러도 you can feel me
눈빛만 봐도 알면서 my love

누구 사랑 먹고 그리 이쁘게 컸니
Mommy or your daddy or them both
Lovey-dovey things 너의 곁에 everyday
Good morning good night
너의 이름 부를 때

So lovely day so lovely
Errday with you so lovely
Du durudu durudu du durudu

Spell L.o.v.e.L.e.e
이름만 불러도 you can feel me
눈빛만 봐도 알면서 my love',120112,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'우리들의 블루스','임영웅',
'잊지는 말아요 함께 했던 날들
눈물이 날 때면
그대 뒤를 돌아보면 돼요
아프지 말아요 쓸쓸한 마음에
힘든 일이 참 많았죠 그대에겐
내가 곁에 있을게요
그댈 위해 노래할게요
잊지 말아요
그댈 위해 약속할게요
언젠가 우리 시간 지나면
알게 되겠죠
그땐 웃을 수 있죠 나 약속할게요
그땐 미소 짓겠죠
작은 행복까지 모두
외롭고 지칠 때 손잡아 줄게요
슬픔이 짙어질 때면 위로해 줄
그 한 사람이 될게요
그대 부디 울지 말아요
슬퍼 말아요
그대에게 빛이 될게요
언젠가 우리 시간 지나면
알게 되겠죠
그땐 웃을 수 있죠 나 약속할게요
폭풍 속에 혼자 남아 헤매도 오
길이 되어 지킬게요 그대
그댈 위해 노래할게요
잊지 말아요
그댈 위해 약속할게요
어두운 길을 밝게 비추는
그대의 빛이 될게요',103849,'발라드',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Welcome to the Show','DAY6 (데이식스)',
'이젠 혼자가 아닐 무대
너무나 감격스러워
끝없는 가능성 중에
날 골라줘서 고마워

나와 맞이하는 미래가
위태로울지도 몰라
하지만 눈물 가득한
감동이 있을지도 몰라

그래도
내 손
놓지 않겠다면
If so
Then let’s go
Welcome to the show

Oh

이것만큼은 맹세할게
내 전부를 다 바칠게
네 눈빛 흔들리지 않게
널 바라보며 서 있을게

알아 너의 결정이
쉽지 않았을 거야
후회 없게 하는 건
이제 나의 몫이야

끝까지
같이
함께 가겠다면
If so
Then let’s go
Welcome to the show

Oh

이것만큼은 맹세할게
내 전부를 다 바칠게
네 눈빛 흔들리지 않게
널 바라보며 서 있을게

막이 내릴 그날에도
그때도 네 손 꼭 잡은 채

너라서 행복했다고
서로가 말할 수 있도록

이것만큼은 맹세할게
내 전부를 다 바칠게
네 눈빛 흔들리지 않게
널 바라보며 서 있을게

Oh
Oh',26503,'락',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Hype Boy','NewJeans',
'(1,2,3,4)
Baby, got me looking so crazy
빠져버리는 daydream
Got me feeling you
너도 말해줄래

누가 내게 뭐라든
남들과는 달라 넌
Maybe you could be the one

날 믿어봐 한번
I’m not looking for just fun
Maybe I could be the one

Oh baby
예민하대 나 lately
너 없이는 매일 매일이 yeah
재미없어 어쩌지

I just want you
Call my phone right now
I just wanna hear you’re mine

‘Cause I know what you like boy
You’re my chemical hype boy
내 지난날들은
눈 뜨면 잊는 꿈
Hype boy 너만 원해
Hype boy 내가 전해

And we can go high
말해봐 yeah
느껴봐 mm mm
Take him to the sky
You know I hype you boy

눈을 감아
말해봐 yeah
느껴봐 mm mm
Take him to the sky
You know I hype you boy

잠에 들려고 잠에 들려 해도
네 생각에 또 새벽 세 시 uh-oh
알려줄 거야 they can’t have you no more
봐봐 여기 내 이름 써있다고
누가 내게 뭐라든
남들과는 달라 넌
Maybe you could be the one

날 믿어봐 한번
I’m not looking for just fun
Maybe I could be the one

Oh baby
예민하대 나 lately
너 없이는 매일 매일이 yeah
재미없어 어쩌지

I just want you
Call my phone right now
I just wanna hear you’re mine

‘Cause I know what you like boy
You’re my chemical hype boy
내 지난날들은
눈 뜨면 잊는 꿈
Hype boy 너만 원해
Hype boy 내가 전해

And we can go high
말해봐 yeah
느껴봐 mm mm
Take him to the sky
You know I hype you boy

눈을 감아
말해봐 yeah
느껴봐 mm mm
Take him to the sky
You know I hype you boy',287050,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Get A Guitar','RIIZE',
'If you want something
to play with get a guitar
너와 내 느낌대로
Make it 시작해 봐
발 박자를 맞추고
손은 Snapping like
one two five
모두 집중해 줘
When I play the guitar
Cause I know you know

Ooh baby ooh
I love it 너와 맞추는 눈
Ooh baby ooh
I love it 너와 맞추는 춤
Rhythm 속에 그려보는 햇살
가득 담은 꿈 In my heart
Tell me while

You play me like dun dun dun
Still I love it 너와 맞추는 눈
Baby dun dun dun
Still I love it 너와 맞추는 춤

Get get get get a guitar
Get get get get a guitar
Get get get get a guitar
Get get get get a guitar

If you want something
to play with get a guitar
가볍게 툭
어깨에 메고 시작해 봐
불타오를 Love and youth
외치는 순간 Feel the vibe
맘이 가는 대로
Play it get a guitar
Cause I know you know

Ooh baby ooh
I love it 너와 맞추는 눈
Ooh baby ooh
I love it 너와 맞추는 춤
Rhythm 속에 그려보는 햇살
가득 담은 꿈 In my heart
Tell me while

You play me like dun dun dun
Still I love it 너와 맞추는 눈
Baby dun dun dun
Still I love it 너와 맞추는 춤

Ooh baby ooh
I love it 너와 맞추는 눈
Ooh baby ooh
I love it 너와 맞추는 춤
네가 원하던 그 순간
다른 생각들은 다 벗어나
Tell me while

You play me like dun dun dun
Still I love it 너와 맞추는 눈
Baby dun dun dun
Still I love it 너와 맞추는 춤

Get get get get a guitar
Get get get get a guitar
Get get get get a guitar
Get get get get a guitar

Get get get get a guitar',87640,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'사막에 꽃을 피우듯','우디 (Woody)',
'아침에 눈 뜨는 게 너무 행복해졌어
널 사랑한다 말할 수 있어서 하늘에 감사해
⠀
네 번의 계절을 너와 함께할게
평생토록 더 오래도록 더 영원토록
⠀
음악처럼 꿈처럼
매일 새롭게 사랑을 주고 싶어
지금처럼 곁에 있어 주기를 언제나
⠀
사막에서 꽃을 피우듯 널 만난 건 기적인 걸
설렘이 사라지더라도 이 사랑을 지켜줄게
⠀
허물없이 지내다가도
힘든 날엔 말없이 기댈 수 있게
언제나 네 곁에 내가 서 있을게
⠀
한 걸음 한 걸음
어둡지 않게 내가 널 비춰줄게
지금처럼 곁에 있어 주면 돼 언제나
⠀
사막에서 꽃을 피우듯 널 만난 건 기적인 걸
설렘이 사라지더라도 이 사랑을 지켜줄게
⠀
허물없이 지내다가도
힘든 날엔 말없이 기댈 수 있게
언제나 네 곁에 내가 서 있을게
⠀
너와 함께하는 이 시간이
조금만 더 천천히 흘러가길
⠀
어떤 날엔 웃게 해 줄게
좋은 날엔 더 안아줄게
슬픈 날엔 그냥 울어도 돼
내가 더 노력할게
⠀
허물없이 지내다가도
힘든 날엔 말없이 기댈 수 있게
언제나 네 곁에 내가 서 있을게
⠀
언제나 네 곁에 있을게',83656,'발라드',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Do or Die','임영웅',
'함성이 번져 숨이 차올라
이 밤의 주인공 쏟아진 Spotlight
멈추지 마라 힘껏 외쳐봐
우리 오늘 후회 없도록
더 두려울 것이 없어 타오르는 너의 heart beat
모두가 함께 미쳐 하늘로 높이 뛰어
열정을 채워줄게 날 따라 함께하게
Let’s Go, Go Baby
나만 믿고 따라와 따라와
너를 위해 난 노래할 거야
심장소리 난리 나 난리 나
Put your hands up in the air
Just raise your hands
미쳐 이 순간
Tonight It’s Do or Die
Tonight It’s Do or Die
세상을 뒤흔들어 봐 뛰어봐
Move your body like It’s Do or Die
Woah
Woah
Like It’s Do or Die
Woah
Woah
Like It’s Do or Die
나사 하나 빠진 것처럼 막
향기에 취해버린 것처럼 now
오직 너만의 영웅이 되어
모든 걱정을 다 막아줄게
오늘 밤 우린 Party Time
분위기를 전부 휘어잡아
맘이 시키는 그대로 춤춰
나만 믿고 따라와 따라와
너를 위해 난 노래할 거야
심장소리 난리 나 난리 나
Put your hands up in the air
[Hook]
Just raise your hands
미쳐 이 순간
Tonight It’s Do or Die
Tonight It’s Do or Die
세상을 뒤흔들어 봐 뛰어봐
Move your body like It’s Do or Die
Woah
Woah
Like It’s Do or Die
Woah
Woah
Like It’s Do or Die
가슴 벅찬 이 순간 (Right Now)
Let’s turn up
Let’s get loud
기억해 오늘 너와 나 (You and I)
Let’s get loud
Just raise your hands
미쳐 이 순간
Tonight Let’s Do or Die
Tonight Let’s Do or Die
세상을 뒤흔들어 봐 뛰어봐
Move your body like It’s do or die
Woah
Woah
Like It’s Do or Die
Woah
Woah',41296,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'다시 만날 수 있을까','임영웅',
'너를 위해 해 줄 것이 하나 없어서
보낼 수밖에 없었고
네가 없이 사는 법을 알지 못해서
순간순간을 울었다
후회로 가득한 한숨 자락이
시린 바람처럼
가슴 치는 날 그 언젠가
우리 만날 수 있을까
다시 만날 수 있을까
그리 좋던 예전처럼 그때처럼
되돌아갈 수 있을까
다시 우리가 만나면
무엇을 해야만 할까
서로를 품에 안고서
하염없이 눈물만 흘려볼까
붙잡을 마음이야 없었겠냐마는
그때 난 부끄러웠다
떳떳하게 일어나 널 다시 찾아갈
뜨거운 꿈만 꾸었다
둘이 함께 했던 순간순간이
시린 폭포처럼
쏟아지는 날 그 언젠가
우리 만날 수 있을까
다시 만날 수 있을까
그리 좋던 예전처럼 그때처럼
되돌아갈 수 있을까
다시 우리가 만나면
무엇을 해야만 할까
서로를 품에 안고서
하염없이 눈물만 흘려볼까
그리운 마음이 서럽게 흘러넘쳐
너에게 닿을 때
우리 만날 수 있을까
다시 만날 수 있을까
그리 좋던 예전처럼 그때처럼
되돌아갈 수 있을까
다시 우리가 만나면
무엇을 해야만 할까
서로를 품에 안고서
하염없이 눈물만 흘려볼까',84563,'발라드',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'퀸카 (Queencard)','(여자)아이들',
'Hey you
뭘 보니? 내가 좀 Sexy Sexy 반했니
Ye you
뭐 하니? 너도 내 Kiss Kiss 원하니
월 화 수 목 금 토 일 미모가 쉬지를 않네
머리부터 발끝까지 눈부셔 빛이 나네
Oh 저기 언니야들 내 Fashion을 따라 하네
아름다운 여자의 하루는 다 아름답네
이 Party에 준비된 Birthday cake
태어나서 감사해 Every day
I don’t need them
그래 내가 봐도 난
퀸카 I’m hot
My boob and booty is hot
Spotlight 날 봐
I’m a star star star
퀸카 I’m the top
I’m twerking on the runway
I am a 퀸카
You wanna be the 퀸카
I’m a 퀸카
I’m a 퀸카
I’m a I’m a I’m a 퀸카
I’m a 퀸카 (Take a photo)
I’m a 퀸카
I’m a 퀸카
I’m a I’m a I’m a 퀸카
I’m a 퀸카
Look so cool look so sexy
like Kim Kardashian
Look so cute look so pretty like Ariana
I wanna with you 뽀뽀
I wanna with you 포옹
자꾸 예뻐져 거울 속 너어~
이 Party에 준비된 (Blue) Champagne
태어난 걸 축하해 Every day
I don’t need them
그래 내가 봐도 난
퀸카 I’m hot
My boob and booty is hot
Spotlight 날 봐
I’m a star star star
퀸카 I’m the top
I’m twerking on the runway
I am a 퀸카
You wanna be the 퀸카
I’m a 퀸카
I’m a 퀸카
I’m a I’m a I’m a 퀸카
I’m a 퀸카 (Take a photo)
I’m a 퀸카
I’m a 퀸카
I’m a I’m a I’m a 퀸카
I’m a 퀸카
아무거나 걸친 Girl 퀸카카카
마르거나 살찐 Girl 퀸카카카
자신감 넘치는 Girl 퀸카카카
I am a 퀸카
You wanna be the 퀸카',142835,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'너의 편이 돼 줄게','다비치',
'오늘 어떤 하루를 보냈나요
별일 없다면 다행이에요
꾹 다문 입술 잠깐 스친 표정에
괜스레 걱정이 되네요

애써 웃음 짓는 그대를 보면
내가 뭐든 다 해주고 싶어
움츠린 어깨 안아줄 수 있어서
그게 고마운 걸요

언제라도 너의 편이 돼 줄게
어디로든 같이 걸어 갈게
꼭 잡은 두 손 어느새 닮아 있는 우리
이렇게 완벽할 수 있나요

혹시라도 고단한 세상 속에
초라한 모습에 숨고 싶을 때
나에게 와요 기대어 앉아요
늘 내가 있을게요 그대 곁에

눈을 맞추며 안부를 묻는 게
이렇게 따뜻할 수 있나요
평범한 날들 특별할 것 없지만
이게 행복인 걸 알죠

언제라도 너의 편이 돼 줄게
어디로든 같이 걸어 갈게
꼭 잡은 두 손 어느새 닮아 있는 우리
이렇게 완벽할 수 있나요

혹시라도 고단한 세상 속에
초라한 모습에 숨고 싶을 때
나에게 와요 기대어 앉아요
늘 내가 있을게요 그대 곁에

별 볼일 없던 메마른
어지럽던 나의 일상에
눈부신 너라서 지켜낼 거야
간절히 함께할 거야

언젠가는 불어온 바람에
쓰러질 듯 두려운 맘 앞에
사랑해 말하며 서로를 바라보는 일
이렇게 눈물 날 수 있나요

혹시라도 엉망이 된 하루에
도망치고 싶어 지친 맘일 때
나에게 와요 기대어 앉아요
늘 내가 있을게요 그대 곁에',4570,'발라드',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Baddie','IVE (아이브)',
'Imma baddie baddie baddie
Pretty little risky baddie
뭐든 될 대로 되라지 Catch me if you can
Baddie baddie baddie
나는 없어 거기 이미
어차피 못 찾을 테니 Catch me if you can

Nothing like the regulars
내 DNA엔 blue blood runs
더 솔직하게 말해줘 착한 척은 지겨워
우리 앞에선 룰이
의미 없었어 굳이
유행이 돌고 돌아도 난 그 틀에 없어 이미
I wanna break I wanna kick
뛰어 놀래 시끄럽게
다채로운 매력 수많은 변칙 위에 더 빛을 발하지

답답한 건 벗어 던져
고개 숙일 필요 없어

Imma baddie baddie baddie
Pretty little risky baddie
뭐든 될 대로 되라지 Catch me if you can
Baddie baddie baddie
나는 없어 거기 이미
어차피 못 찾을 테니 Catch me if you can

And the fit pop like bubblegum
내 판단을 믿어 난
할말도 많아 참
모자이크 없이 Spit it out
난 즐겨 이 troublesome
그 누구도 Can’t bite me
원한다면 Come try me
언제든 You’re invited
난 thriller 속 villain
생각할 시간에 저지르는 게 my motto

Imma baddie baddie baddie
Pretty little risky baddie
뭐든 될 대로 되라지 Catch me if you can
Baddie baddie baddie
앞 다퉈 내 길을 막지
가뿐히 날아 오를 테니 Catch me if you can

Imma baddie baddie baddie
어딜 그리 바삐 가니
뭐든 될 대로 되라지 Catch me if you can
Baddie baddie baddie
나는 없어 거기 이미
어차피 못 찾을 테니 Catch me if you can

Imma baddie baddie baddie
어딜 그리 바삐 가니
뭐든 될 대로 되라지 Catch me if you can
Baddie baddie baddie
나는 없어 거기 이미
어차피 못 찾을 테니 Catch me if you can',67634,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'이제 나만 믿어요','임영웅',
'무얼 믿은 걸까 부족했던 내게서
나조차 못 믿던 내게 여태 머문 사람
무얼 봤던 걸까 가진 것도 없던 내게
무작정 내 손을 잡아 날 이끈 사람
최고였어
그대 눈 속에 비친 내 모습
이제는 내게서 그댈 비춰줄게
궂은 비가 오면
세상 가장 큰 그대 우산이 될게
그댄 편히 걸어가요
걷다가 지치면
내가 그대를 안고 어디든 갈게
이제 나만 믿어요
나만 두고 가던
나만 스쳐 간 행운이 모여
그대가 되어서 내게 와준 거야
궂은 비가 오면
세상 가장 큰 그대 우산이 될게
그댄 편히 걸어가요
걷다가 지치면
내가 그대를 안고 어디든 갈게
이제 나만 믿어요
나의 마지막 주인공이 되어
다신 누구 앞에서도
그대는 고개 숙이지 마요
내가 보지 못했던 홀로 고단했던 시간
고맙고 미안해요 사랑해요
이 세상은
우리를 두고 오랜 장난을 했고
우린 속지 않은 거야
이제 울지 마요
좋을 땐 밤새도록 맘껏 웃어요
전부 그대 꺼니까
그대는 걱정 말아요
이제 나만 믿어요',174063,'트로트',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Super Shy','NewJeans',
'I’m super shy, super shy
But wait a minute while I
Make you mine, make you mine
떨리는 지금도
You’re on my mind
All the time
I wanna tell you but I’m
Super shy, super shy

I’m super shy, super shy
But wait a minute while I
Make you mine, make you mine
떨리는 지금도
You’re on my mind
All the time
I wanna tell you but I’m
Super shy, super shy

And I wanna go out with you
Where you wanna go? (Huh?)
Find a lil spot
Just sit and talk
Looking pretty
Follow me
우리 둘이 나란히
보이지? (봐)
내 눈이 (heh)
갑자기
빛나지
When you say
I’m your dream

You don’t even know my name
Do ya?
You don’t even know my name
Do ya-a?
누구보다도

I’m super shy, super shy
But wait a minute while I
Make you mine, make you mine
떨리는 지금도
You’re on my mind
All the time
I wanna tell you but I’m
Super shy, super shy

I’m super shy, super shy
But wait a minute while I
Make you mine, make you mine
떨리는 지금도
You’re on my mind
All the time
I wanna tell you but I’m
Super shy, super shy

나 원래 말도 잘하고 그런데 왜 이런지
I don’t like that
Something odd about you
Yeah you’re special and you know it
You’re the top babe

I’m super shy, super shy
But wait a minute while I
Make you mine, make you mine
떨리는 지금도
You’re on my mind
All the time
I wanna tell you but I’m
Super shy, super shy

I’m super shy, super shy
But wait a minute while I
Make you mine, make you mine
떨리는 지금도
You’re on my mind
All the time
I wanna tell you but I’m
Super shy, super shy

You don’t even know my name
Do ya?
You don’t even know my name
Do ya-a?
누구보다도
You don’t even know my name
Do ya?
You don’t even know my name
Do ya-a?',161242,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'무지개','임영웅',
'오늘 하루 어땠었나요
많이 힘들었나요
쉬지 않고 달려왔던 길에서
나와 함께 쉬어가요
그냥 아무런 준비도 없이
떠나볼까요
평범해도 좋으니까
우리 함께 가요
Du Du Du Du Du
행복 가득 담은 배낭 하나 메고서
답답했던 일상과 도심을 벗어나
Du Du Du Du
Du Du Du Du
떠나볼래요
힘껏 살다 보니 무뎌져
헝클어진 머리도
괜찮다며 그댈 안아줄 사람
바로 그대 곁에 있죠
까만 선글라스 하나 챙겨서
떠나볼까요
평범해도 좋으니까
우리 함께 가요
Du Du Du Du Du
행복 가득 담은 배낭 하나 메고서
답답했던 일상과 도심을 벗어나
Du Du Du Du
Du Du Du Du
떠나볼래요
우리 함께 가요
Du Du Du Du Du
행복 가득 담은 배낭 하나 메고서
답답했던 일상과 도심을 벗어나
Du Du Du Du
Du Du Du Du
떠나볼래요
우리 함께 가요
Du Du Du Du Du
Du Du Du Du
Du Du Du Du
떠나볼래요
Du Du Du Du
Du Du Du Du
떠나볼래요
Du Du Du Du
Du Du Du Du
지금 떠나요',73467,'팝락',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'봄날','방탄소년단',
'보고 싶다
이렇게 말하니까 더 보고 싶다
너희 사진을 보고 있어도
보고 싶다
너무 야속한 시간
나는 우리가 밉다
이젠 얼굴 한번 보는 것 조차
힘들어진 우리가
여긴 온통 겨울 뿐이야
8월에도 겨울이 와
마음은 시간을 달려가네
홀로 남은 설국열차
니 손 잡고 지구 반대편까지 가
겨울을 끝내고파
그리움들이 얼마나
눈처럼 내려야 그 봄날이 올까
Friend
허공을 떠도는
작은 먼지처럼 작은 먼지처럼
날리는 눈이 나라면
조금 더 빨리
네게 닿을 수 있을 텐데
눈꽃이 떨어져요
또 조금씩 멀어져요
보고 싶다 보고 싶다
보고 싶다 보고 싶다
얼마나 기다려야
또 몇 밤을 더 새워야
널 보게 될까 널 보게 될까
만나게 될까 만나게 될까
추운 겨울 끝을 지나
다시 봄날이 올 때까지
꽃 피울 때까지
그곳에 좀 더 머물러줘
머물러줘
니가 변한 건지
니가 변한 건지
아니면 내가 변한 건지
내가 변한 건지
이 순간 흐르는 시간조차 미워
우리가 변한 거지 뭐
모두가 그런 거지 뭐
그래 밉다 니가 넌 떠났지만
단 하루도 너를
잊은 적이 없었지 난
솔직히 보고 싶은데
이만 너를 지울게
그게 널 원망하기보단
덜 아프니까
시린 널 불어내 본다
연기처럼 하얀 연기처럼
말로는 지운다 해도
사실 난 아직 널 보내지 못하는데
눈꽃이 떨어져요
또 조금씩 멀어져요
보고 싶다 보고 싶다
보고 싶다 보고 싶다
얼마나 기다려야
또 몇 밤을 더 새워야
널 보게 될까 널 보게 될까
만나게 될까 만나게 될까
You know it all
You’re my best friend
아침은 다시 올 거야
어떤 어둠도 어떤 계절도
영원할 순 없으니까
벚꽃이 피나봐요
이 겨울도 끝이 나요
보고 싶다 보고 싶다
보고 싶다 보고 싶다
조금만 기다리면
며칠 밤만 더 새우면
만나러 갈게 만나러 갈게
데리러 갈게 데리러 갈게
추운 겨울 끝을 지나
다시 봄날이 올 때까지
꽃 피울 때까지
그곳에 좀 더 머물러줘
머물러줘',560260,'랩/힙합',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'잘 지내자, 우리 (여름날 우리 X 로이킴)','로이킴',
'마음을 다 보여줬던 너와는 다르게
지난 사랑에 겁을 잔뜩 먹은
나는 뒷걸음질만 쳤다

너는 다가오려 했지만
분명 언젠가 떠나갈 것이라 생각해
도망치기만 했다

같이 구름 걸터앉은 나무 바라보며
잔디밭에 누워
한 쪽 귀로만 듣던 달콤한 노래들이
쓰디쓴 아픔이 되어
다시 돌아올 것만 같아

분명 언젠가 다시 스칠 날 있겠지만
모른 척 지나가겠지
최선을 다한 넌 받아들이겠지만
서툴렀던 난
아직도 기적을 꿈꾼다
눈 마주치며 그땐 미안했었다고
용서해달라고 얘기하는 날
그때까지 잘 지내자 우리 우리

지금 생각해보면 그까짓 두려움
내가 바보 같았지 하며
솔직해질 자신 있으니
돌아오기만 하면 좋겠다

분명 언젠가 다시 스칠 날 있겠지만
모른 척 지나가겠지
최선을 다한 넌 받아들이겠지만
서툴렀던 난
아직도 기적을 꿈꾼다
눈 마주치며 그땐 미안했었다고
용서해달라고 얘기하는 날
그때까지 잘 지내자 우리 우리

눈 마주치며 그땐 미안했다고
용서해달라고 이야기 하는 날
그때까지
잘 지내자
우리',77429,'록/포크(국내)',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'You & Me','제니 (JENNIE)',
'You know I gotcha
You know that I got you like that
Ain’t nobody gonna have your back
like the way I do
You love it just say you do

You know you got me
Everything you do
Everything you did
Everything I wish I was with
Makes me feel alright
I’m just saying so

I really like it
Nothing in the world can make me feel the way you do the things you do
I really like it
Nothing in the world can make me feel the way you do the things you do

I love you and me
Dancing in the moonlight
Nobody can see
It’s just you and me tonight
I love you and me
Dancing in the moonlight
Nobody can see
It’s just you and me tonight

Look at you now look at me
How you ever ever gonna find someone like this
Look at you now look at me
How you ever ever gonna find someone like this

You’re the reason my heart skips drops
Just a little touch my world stops
Finally I know that you’re mine
I don’t want to fall
Don’t wanna play this game of love oh eh oh
There’s nowhere to hide

I really like it
Nothing in the world can make me feel the way you do the things you do
I really like it
Nothing in the world can make me feel the way you do the things you do

I love you and me
Dancing in the moonlight
Nobody can see
It’s just you and me tonight
I love you and me
Dancing in the moonlight
Nobody can see
It’s just you and me tonight

Look at you now look at me
How you ever ever gonna find someone like this
Look at you now look at me
How you ever ever gonna find someone like this

I don’t care about your first love,
This should be your last one
Nothin’ like your last one
You look better on me, that’s fashion
Won’t block your shot, lights camera action
Never been a love me or a love me not thing
Every petal better tell him better not change
I love you I love me a lot, wait
Which one I love better, better off not saying

I love you and me',68202,'댄스',DEFAULT);

INSERT INTO "MUSIC_BOARD"
VALUES(SEQ_SONG_NO.NEXTVAL,'Ditto','NewJeans',
'Woo woo woo woo ooh
Woo woo woo woo
Stay in the middle
Like you a little
Don’t want no riddle
말해줘 say it back
Oh say it ditto
아침은 너무 멀어
So say it ditto
훌쩍 커버렸어
함께한 기억처럼
널 보는 내 마음은
어느새 여름 지나 가을
기다렸지 all this time
Do you want somebody
Like I want somebody
날 보고 웃었지만
Do you think about me now yeah
All the time yeah
All the time
I got no time to lose
내 길었던 하루
난 보고 싶어
Ra-ta-ta-ta 울린 심장 (Ra-ta-ta-ta)
I got nothing to lose
널 좋아한다고
wooah wooah wooah
Ra-ta-ta-ta 울린 심장 (Ra-ta-ta-ta)
But I don’t want to
Stay in the middle
Like you a little
Don’t want no riddle
말해줘 say it back
Oh say it ditto
아침은 너무 멀어
So say it ditto
I don’t want to
Walk in this 미로
다 아는 건 아니어도
바라던 대로
말해줘 Say it back
Oh say it ditto
I want you so, want you
So say it ditto
Not just anybody
너를 상상했지
항상 닿아있던
처음 느낌 그대로 난
기다렸지 all this time
I got nothing to lose
널 좋아한다고
wooah wooah wooah
Ra-ta-ta-ta 울린 심장 (Ra-ta-ta-ta)
But I don’t want to
Stay in the middle
Like you a little
Don’t want no riddle
말해줘 say it back
Oh say it ditto
아침은 너무 멀어
So say it ditto
I don’t want to
Walk in this 미로
다 아는 건 아니어도
바라던 대로
말해줘 Say it back
Oh say it ditto
I want you so, want you
So say it ditto
Woo woo woo woo ooh
Woo woo woo woo',280939,'댄스',DEFAULT);

SELECT * FROM "MUSIC_BOARD"
ORDER BY SONG_NO;



-- 운영자 계정 생성
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, '0000','0000','운영자', DEFAULT);



-- 테스트 회원 넣기
INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user01','pass01','유저일',DEFAULT);

INSERT INTO "MEMBER"
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user02','pass02','유저이',DEFAULT);




-- PLAYLIST 테이블에 테스트 곡 추가
INSERT INTO "PLAYLIST"
VALUES(SEQ_LIST_NO.NEXTVAL, '첫 만남은 계획대로 되지 않아', 'TWS(투어스)',
'Ay ay ay ay ay

거울 속에 내 표정 봐 봐
느낌 So good 기다려온 D-day
연습했던 손든 인사도 그대로 하면 돼
Hairstyle check하고 한 번 Turn around

발걸음은 매일 걷던 그 길로
계획은 완벽
빨리 말 걸어보고 싶어, Hey

Woo 문 앞에서 셋을 세어본다, Yeh

(셋, 둘, 하나)

첫 만남은 너무 어려워
계획대로 되는 게 없어서
첫 만남은 너무 어려워
내 이름은 말야

Hey,
안녕, 첫 마디를 건넬 때
주변 소린 Canceled
네 말소리는 Playlist

Yeh,
질문은 나의 용기, 알려줘 너의
“이름이 뭐야?”

너와 내 거리는 세 걸음 남았어, Yeh

(셋, 둘, 하나)

첫 만남은 너무 어려워
계획대로 되는 게 없어서
첫 만남은 너무 어려워
내 이름은 말야

이 순간, Feels so wonderful
조금은 뚝딱거려도
어색한 인사까지도
너와 나의 첫 만남

우리의 사이 Beautiful
내일도 내일모레도
기억해, 영원히 반짝일 순간

Wait wait!

Na na na-

이렇게 만나서 반가워
내일 또 봐 안녕', DEFAULT, DEFAULT, 1);

INSERT INTO "PLAYLIST"
VALUES(SEQ_LIST_NO.NEXTVAL,'무지개','임영웅',
'오늘 하루 어땠었나요
많이 힘들었나요
쉬지 않고 달려왔던 길에서
나와 함께 쉬어가요
그냥 아무런 준비도 없이
떠나볼까요
평범해도 좋으니까
우리 함께 가요
Du Du Du Du Du
행복 가득 담은 배낭 하나 메고서
답답했던 일상과 도심을 벗어나
Du Du Du Du
Du Du Du Du
떠나볼래요
힘껏 살다 보니 무뎌져
헝클어진 머리도
괜찮다며 그댈 안아줄 사람
바로 그대 곁에 있죠
까만 선글라스 하나 챙겨서
떠나볼까요
평범해도 좋으니까
우리 함께 가요
Du Du Du Du Du
행복 가득 담은 배낭 하나 메고서
답답했던 일상과 도심을 벗어나
Du Du Du Du
Du Du Du Du
떠나볼래요
우리 함께 가요
Du Du Du Du Du
행복 가득 담은 배낭 하나 메고서
답답했던 일상과 도심을 벗어나
Du Du Du Du
Du Du Du Du
떠나볼래요
우리 함께 가요
Du Du Du Du Du
Du Du Du Du
Du Du Du Du
떠나볼래요
Du Du Du Du
Du Du Du Du
떠나볼래요
Du Du Du Du
Du Du Du Du
지금 떠나요',DEFAULT, DEFAULT, 1);




COMMIT;
