.MODEL SMALL
 
.STACK 100H

.DATA   

;;msg lines  
sign1 db "----------------------------$"
log_page db "X  ----- Login page -----  X$"
wrong_username db "You have entered an invalid username or password. Please try again.$" 
inc_items db "If you want to modify the number of genres, type 1. If you want to log out, type 2. And if you want to see the genres again, type 3.$"
invalid_inp db "Admin, you have entered a wrong instruction. Please correct it and try again.$"
with_genres db "If you want to increase a genre, type 1. If you want to decrease a genre, type 2. And if you want to go back, type 3.$"
;;with_books db "If you want to increase a book(in all genres), type 1. If you want to decrease a book(in all genres), type 2. And if you want to go back, type 3.$"
good_work db "Good work today (^^). $"
inc_msg_genre db "New genre added in the library.$"
dec_msg_genre db "Old genre removed from the library.$"
;;inc_msg_book db "1 New book added in all genres.$"
;;dec_msg_book db "1 Old book removed from all genres.$"
user_input db "Enter your input here: $" 
details db "XXXX------------------Details-------------------XXXX$"


;;welcome messages for customer panel
greet_1 db "X                  welcome to our small online book store                   X$"
greet_2 db "-----------------------------------------------------------------------------$" 
greet_3 db "     !!!You can select books from our different collections of genres!!!     $"
greet_4 db "!!You can even search and try to see if your favourite book is in stock or not!!$"
greet_5 db "          !!!Hope you can find the book, you are looking for (^^) !!!         $"
greet_6 db "X                             Dear customer,                                X$"   


;;welcome messages for admin panel
greet_7 db "X                  welcome,admin                   X$"
greet_8 db "----------------------------------------------------$" 
greet_9 db "X      !!!Let's make the best out of today!!!      X$" 



;;login messages
login_username db "Username: $"
login_pass db "Password: $"

;;all users login details
admin db "admin$"
adminpass db "admin$"
user1 db "user1$"
user1pass db "user1$"
user2 db "user2$"
user2pass db "user2$"
user3 db "user3$"
user3pass db "user3$" 


;;taking_input
name_ db 5 dup(?)
pass_ db 5 dup(?)


;;genres 
total_genres db 3
update_genres db 3
genres_available db "The number of genres available are : $"
a db "genre : Action$"
d db "genre : Drama$"
m db "genre : Mystery$"
r db "genre : Romance$"
w db "genre : War$"
h db "genre : Horror$"
error_max_genres db "Database has reached max space, so can't introduce more genres.$" 
error_min_genres db "There are no genres left to delete from the database.$"



;;array of books
action db "Allegiant___50$", "Divergent___60$", "Insurgent___60$", "Jackson_____80$", "Superman___120$", "Black Clover_90$"
    
drama db "Hamlet_____200$", "Macbeth____250$", "Othelo_____100$", "Tempest____200$", "Night______180$", "Hill Heimer_80$"

mystery db  "Blue Bird__200$", "Dead Time__130$", "Gone Girl___90$", "The Woods__290$", "Mirai Nikki_45$", "Call9210___150$"
    
romance db "Book Lovers_40$", "Clueless____40$", "Jane Eyre__400$", "Outlander___80$", "After time__90$", "Meeting____140$"

war db "Gladiater__120$", "Kanguva_____80$", "Gold Run___170$", "Mutant_____160$", "Kalki9900___60$", "Kingdom____200$"

horror db "Sting______120$", "Don't come__70$", "Time Cut___160$", "Afraid_____200$", "Hellboy_____20$", "Outsider___500$"

total_books dw 3
;;update_books dw 3 
;;error_max_books db "Ran out of space, so no books can be added.$" 
;;error_min_books db "There are no books left to delete from all genres.$"



;;numbering
num db 31h 

;;AL's variables end here

genre_msg db 'Select a Genre:', 0Dh, 0Ah, '1. Action', 0Dh, 0Ah, '2. Drama', 0Dh, 0Ah, '3. Mystery', 0Dh, 0Ah, '4. Exit', 0Dh, 0Ah, '$'
Action_msg db 'Action Books:', 0Dh, 0Ah, 'a. Allegiant___50', 0Dh, 0Ah, 'b. Divergent___60', 0Dh, 0Ah, 'c. Insurgent___60', 0Dh, 0Ah, 'x. Back to Genres', 0Dh, 0Ah, '$'
Drama_msg db 'Drama Books:', 0Dh, 0Ah, 'a. Hamlet_____200', 0Dh, 0Ah, 'b. Macbeth____250', 0Dh, 0Ah, 'c. Othelo_____100', 0Dh, 0Ah, 'x. Back to Genres', 0Dh, 0Ah, '$'
Mystery_msg db 'romance Books:', 0Dh, 0Ah, 'a. Blue Bird__200', 0Dh, 0Ah, 'b. Dead Time__130', 0Dh, 0Ah, 'c. Gone Girl___90', 0Dh, 0Ah, 'x. Back to Genres', 0Dh, 0Ah, '$'
cart_msg db 'Book added to your cart!', 0Dh, 0Ah, '$'
exit_msg db 'Thank you for visiting the Online Book Store!', 0Dh, 0Ah, '$'

invalid_msg db 'Invalid choice! Please restart the program.', 0Dh, 0Ah, '$'


.CODE
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 

;;login interface
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h  


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h  


mov ah, 9
lea dx, sign1
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h  


mov ah, 9
lea dx, log_page
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 9
lea dx, sign1
int 21h 

jmp taking_input



;user input
againtry: 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h  


mov ah, 9
lea dx, wrong_username
int 21h 



taking_input:

;taking username from user

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, login_username
int 21h 


mov cx, 5
mov si, 0

take_name:
mov ah, 1 
int 21h 
mov name_[si], al
inc si
loop take_name  


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h  


;taking password from the user
mov ah, 9
lea dx, login_pass
int 21h 


mov cx, 5
mov si, 0

take_pass:
mov ah, 1 
int 21h 
mov pass_[si], al
inc si
loop take_pass

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


;;comparing username 
;for admin
check0:
mov cx, 5
mov si, 0

aduser:

;for admin
mov al, admin[si]
mov bl, name_[si]

cmp al, bl
jne check1
inc si
loop aduser
jmp admin_pass_check

;for user1
check1:
mov cx, 5
mov si, 0

us1user:
mov al, user1[si]
mov bl, name_[si]

cmp al, bl
jne check2
inc si
loop us1user
jmp user1_pass_check

 
;for user2
check2: 
mov cx, 5
mov si, 0

us2user:
mov al, user2[si]
mov bl, name_[si]

cmp al, bl
jne check3
inc si
loop us2user
jmp user2_pass_check


;for user3
check3: 
mov cx, 5
mov si, 0

us3user:
mov al, user3[si]
mov bl, name_[si]

cmp al, bl
jne againtry
inc si
loop us3user
jmp user3_pass_check





;comparing password


;for admin
admin_pass_check:

mov cx, 5
mov si, 0

adpass:

mov al, adminpass[si]
mov bl, pass_[si]

cmp al, bl
jne againtry
inc si
loop adpass
jmp admin_panel 


user1_pass_check:

mov cx, 5
mov si, 0

us1pass:

mov al, user1pass[si]
mov bl, pass_[si]

cmp al, bl
jne againtry
inc si
loop us1pass
jmp user_panel


user2_pass_check:

mov cx, 5
mov si, 0

us2pass:

mov al, user2pass[si]
mov bl, pass_[si]

cmp al, bl
jne againtry
inc si
loop us2pass
jmp user_panel


user3_pass_check:

mov cx, 5
mov si, 0

us3pass:

mov al, user3pass[si]
mov bl, pass_[si]

cmp al, bl
jne againtry
inc si
loop us3pass
jmp user_panel

;login part ends here


;; admin interface
admin_panel:

;;welcome statement starts here

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_8
int 21h 
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_7
int 21h 
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_9
int 21h 
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_8
int 21h 


;; welcome statement ends here

;;when the admin wants to see the genres again by option 3 in seen_genres
from_start:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov bl, update_genres
mov total_genres, bl


;;Summary of books and genres 

showing_books:

mov ah, 9
lea dx, details
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9 
lea dx, genres_available
int 21h 


mov ah, 2
mov dl, total_genres
add dl, 30h
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


first:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, a
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


act:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, action[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop act

dec total_genres



second:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, d
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


dra:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, drama[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop dra

dec total_genres




third:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h



cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, m
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mys:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, mystery[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop mys

dec total_genres



fourth:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h



cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, r
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


rom:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, romance[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop rom

dec total_genres




fifth:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h



cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, w
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


wa:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, war[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop wa

dec total_genres




sixth:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h



cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, h
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


hor:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, horror[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop hor

dec total_genres





seen_genres:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 9
lea dx, inc_items
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9
lea dx, user_input
int 21h

mov ah, 1
int 21h
 

cmp al, "1"
je modify_genres

cmp al, "2"
je log_out

cmp al, "3"
je from_start

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9
lea dx, invalid_inp
int 21h

jmp seen_genres 



modify_genres:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 

mov ah, 9
lea dx, with_genres
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9
lea dx, user_input
int 21h

mov ah, 1
int 21h

cmp al, "1"
je plus_genre

cmp al, "2"
je minus_genre

cmp al, "3"
je seen_genres 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9
lea dx, invalid_inp
int 21h

jmp modify_genres


plus_genre:
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


inc update_genres

cmp update_genres, 7
je max_genres


mov bl, update_genres
mov total_genres, bl

mov ah, 9
lea dx, inc_msg_genre
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


jmp showing_books



minus_genre:
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


dec update_genres

cmp update_genres, 0
jl min_genres


mov bl, update_genres
mov total_genres, bl

mov ah, 9
lea dx, dec_msg_genre
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


jmp showing_books



max_genres:

dec update_genres 

mov ah, 9
lea dx, error_max_genres
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

jmp seen_genres 


min_genres:

inc update_genres 

mov ah, 9
lea dx, error_min_genres
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

jmp seen_genres


log_out: 
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9 
lea dx, good_work 
int 21h

jmp taking_input


;;user interface
user_panel:

;;welcome statement starts here
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_2
int 21h 
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_6
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
    

mov ah, 9
lea dx, greet_1
int 21h 
        
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 9
lea dx, greet_2
int 21h  

        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
        
mov ah, 9
lea dx, greet_3
int 21h
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
        
mov ah, 9
lea dx, greet_4
int 21h
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
        
mov ah, 9
lea dx, greet_5
int 21h
        

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h        
;; welcome statement ends here


;;;my part (Al-Nahian's) ends here

;;[Welcome page er kaj kore disi, so oita nia pera khete hbe na :)]

;;Nigi's part starts from here

select_genre:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    

    mov ah, 09h              ; Print genre selection message
    lea dx, genre_msg
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 9
    lea dx, user_input
    int 21h

    mov ah, 01h              ; Wait for genre selection input
    int 21h
    mov bl, al               ; Store input in BL register

    cmp bl, '1'              ; Check if input is '1'
    je Action_genre

    cmp bl, '2'              ; Check if input is '2'
    je Drama_genre

    cmp bl, '3'              ; Check if input is '3'
    je Mystery_genre

    cmp bl, '4'              ; Check if input is '4'
    je exit_program
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 09h              ; Print invalid choice message
    lea dx, invalid_msg
    int 21h 

    jmp select_genre         ; Invalid input, re-prompt

Action_genre:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h


    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    mov ah, 09h              ; Print action books
    lea dx, Action_msg
    int 21h
    call book_selection
    jmp select_genre

Drama_genre:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 09h              ; Print drama books
    lea dx, Drama_msg
    int 21h
    call book_selection
    jmp select_genre

Mystery_genre:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 09h              ; Print mystery books
    lea dx, Mystery_msg
    int 21h
    call book_selection
    jmp select_genre

book_selection:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 9
    lea dx, user_input
    int 21h
    
    mov ah, 01h              ; Wait for book selection input
    int 21h

;;;;;;;;;;;;;;Abir cart er kaj, dekho kothay add korba.
 
    
;;    cmp al, 'a'              ; Check if input is 'a'
;;    je something
    
;;    cmp al, 'b'              ; Check if input is 'b'
;;    je something
    
;;    cmp al, 'x'              ; Check if input is 'b' 
;;    je something 

;;;;;;;;;;;;; aita tomar part
    
    cmp al, 'x'              ; Check if input is 'x'
    je exit_genre
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

    mov ah, 09h              ; Print cart message
    lea dx, cart_msg
    int 21h
    ret

exit_genre:
    ret

invalid_choice:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

    mov ah, 09h              ; Print invalid choice message
    lea dx, invalid_msg
    int 21h

exit_program:

    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    
    mov ah, 09h              ; Print exit message
    lea dx, exit_msg
    int 21h

    mov ah, 4Ch              ; Exit the program
    int 21h


;;Nigi's part ends here




















exit:
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN