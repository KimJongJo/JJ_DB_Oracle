SELECT MEMBER_NO, MEMBER_ID, MEMBER_PW, MEMBER_NICKNAME
FROM "MEMBER"
WHERE MEMBER_ID = 'user01'
AND MEMBER_PW = 'pass01'
AND MEMBER_DEL = 'N';

SELECT * FROM "MEMBER";


SELECT * FROM PLAYLIST;

SELECT LIST_NO, SONG_TITLE, SONG_SINGER, SONG_LYRICS, SONG_LIKE_CH, MEMBER_NO
FROM "PLAYLIST"
WHERE MEMBER_NO = 1;


SELECT SONG_NO, SONG_TITLE, SONG_SINGER, SONG_LYRICS, SONG_LIKE, SONG_GENRE
FROM "MUSIC_BOARD";


COMMIT;

UPDATE PLAYLIST SET 
LIST_NO = 2
WHERE SONG_TITLE = '무지개';

SELECT * FROM PLAYLIST
WHERE MEMBER_NO = 1;

SELECT * FROM MUSIC_BOARD;


SELECT SONG_TITLE, SONG_SINGER, SONG_LYRICS, SONG_LIKE, SONG_GENRE
FROM "MUSIC_BOARD"
WHERE SONG_NO = 1;


SELECT * FROM MEMBER;

SELECT * FROM PLAYLIST;



SELECT SONG_TITLE, SONG_SINGER, SONG_LYRICS, SONG_LIKE, SONG_GENRE
FROM MUSIC_BOARD
WHERE SONG_NO = 1;





