#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

cnt := 0
times := 0

; 초 계산 함수
Cal(cnt) {
    return (10*(cnt//50+1))*1000
}

; 매크로 시작
#s::
InputBox, cnt, 오늘 제출 횟수는?
MsgBox, 매크로 시작!
times := Cal(cnt)
SetTimer, Macro, %times%
return

; 매크로 중단
#e::
SetTimer, Macro, Off
MsgBox, 매크로 중단!
return

; 매크로
Macro:
MouseClick, left, 245, 302 ; 제출 메뉴 클릭
Sleep, 2000 ; 잠시 대기
MouseClick, left, 177, 441 ; 언어 드롭다운 메뉴 클릭
Send, text{Enter} ; text 선택
MouseClick, left, 210, 663 ; 소스 코드 클릭
Send, 7890 ; 코드 입력
MouseClick, left, 143, 950 ; 제출 버튼 클릭
Sleep, 2000 ; 잠시 대기
times := Cal(++cnt)
return

; 마우스 좌표 출력
#p::
MouseGetPos, xpos, ypos
MsgBox, (%xpos%, %ypos%)
return