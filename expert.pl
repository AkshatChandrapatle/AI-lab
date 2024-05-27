:- initialization(main).
main :- suggest_movie(M), write('Suggested Movie: '), write(M), nl, halt.

% Check if X is element of List
elem(X,[X|_]).
elem(X,[_|Tail]) :- elem(X,Tail).

% Check whether lists have a common element
elems(X,[Y|_]) :- elem(Y,X).
elems(X,[_|Tail]) :- elems(X,Tail).

% Filter movies based on director, categories, themes
list_movie(Director,Categories,Theme, L) :-
    list_movie(Director,Categories,Theme, [], L).

list_movie(Director,Categories,Theme, Acc, L) :-
    movie(Movie,Director,Category,_,_,Themes),
    elems(Theme,Themes),
    elem(Category,Categories),
    \+ elem(Movie, Acc), !,
    list_movie(Director,Categories,Theme,[Movie|Acc], L).

list_movie(_,_,_, L, L).

% Suggest movie to a user
suggest_movie(M) :- 
    write('Type your age: '),
    read(Age),
    get_category(Age,Categories),
    write('Choose your mood: \n   happy   sad   angry   scared\n'),
    read(Mood),
    write('Choose a director from: \n    rajkumar_hirani   sanjay_leela_bhansali   karan_johar   anurag_kashyap   yash_chopra   rakesh_roshan   amit_sharma   rohit_shetty   kabir_khan   zoya_akhtar   mani_ratnam   imtiaz_ali   vishal_bhardwaj   sriram_raghavan   raj_dk   vikramaditya_motwane   shoojit_sircar   anand_l_rai   siddharth_anand   ali_abbas_zafar   nitesh_tiwari   ashutosh_gowariker   madhur_bhandarkar   farhan_akhtar   tigmanshu_dhulia   abhishek_kapoor   neeraj_pandey   r_balki   sujoy_ghosh   anurag_basusanjay   neeraj_ghaywan   raj_mehta  :\n'),
    read(Director),
    get_theme(Mood,Theme),
    list_movie(Director,Categories,Theme,M).
    
% Get categories from user's age
get_category(Age,X) :- Age < 7, X = [u].
get_category(Age,X) :- Age > 6, Age < 13, X = [u,ua].
get_category(Age,X) :- Age > 12, Age < 16, X = [u,ua,a].
get_category(Age,X) :- Age > 15, Age < 18, X = [u,ua,a].
get_category(Age,X) :- Age > 17, X = [u,ua,a].

% Get themes from user's mood
get_theme(Mood,X) :- 
    Mood = happy, 
    X = [comedy,romance,family,adventure,animation,musical].

get_theme(Mood,X) :-
    Mood = sad,
    X = [drama,romance,biography,family].

get_theme(Mood,X) :-
    Mood = scared,
    X = [horror,thriller,mystery,crime].

get_theme(Mood,X) :-
    Mood = angry,
    X = [action,thriller,crime,drama].

% Database of Hindi movies
% Database of Hindi movies
movie(three_idiots,rajkumar_hirani,u,170,[netflix,prime],[comedy,drama,romance]).
movie(pk,rajkumar_hirani,u,153,[netflix,prime],[comedy,drama,romance]).
movie(munna_bhai_mbbs,rajkumar_hirani,u,156,[netflix,prime],[comedy,drama,romance]).
movie(sanju,rajkumar_hirani,u,155,[netflix,prime],[biography,drama]).
movie(lage_raho_munna_bhai,rajkumar_hirani,u,144,[netflix,prime],[comedy,drama,romance]).
movie(baahubali_2,rajamouli,u,167,[netflix,prime],[action,drama]).
movie(eega,rajamouli,u,134,[netflix],[action,adventure,fantasy]).
movie(makkhi,rajamouli,u,145,[netflix],[action,adventure,fantasy]).
movie(black,sanjay_leela_bhansali,u,122,[prime],[drama]).
movie(padmaavat,sanjay_leela_bhansali,u,163,[prime],[drama,history,romance]).
movie(bajirao_mastani,sanjay_leela_bhansali,u,158,[prime],[drama,history,romance]).
movie(devdas,sanjay_leela_bhansali,u,185,[prime],[drama,musical,romance]).
movie(dilwale_dulhania_le_jayenge,aditya_chopra,u,190,[prime],[romance,drama,comedy]).
movie(mohabbatein,aditya_chopra,u,216,[prime],[romance,drama,musical]).
movie(rab_ne_bana_di_jodi,aditya_chopra,u,167,[prime],[romance,comedy,drama]).
movie(kuch_kuch_hota_hai,karan_johar,u,185,[prime],[romance,drama,comedy]).
movie(kabhi_khushi_kabhie_gham,karan_johar,u,210,[prime],[drama,romance,musical]).
movie(kal_ho_na_ho,karan_johar,u,186,[prime],[drama,romance,comedy]).
movie(kabhi_alvida_na_kehna,karan_johar,u,193,[prime],[drama,romance]).
