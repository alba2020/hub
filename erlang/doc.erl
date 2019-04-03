-module(doc).
-export([
    read_udoc/1,
    read_doc/1,
    main/0
]).

main() ->
    "Hello!".

read_bin_lines(FileName) ->
    {ok, Data} = file:read_file(FileName),
    binary:split(Data, [<<"\n">>], [global]).

read_bin_words(FileName) ->
    {ok, Data} = file:read_file(FileName),
    binary:split(Data, [<<"\n">>, <<"\t">>, <<" ">>], [global]).

b_to_s([H|T]) ->
    H1 = binary_to_list(H),
    T1 = b_to_s(T),
    [H1 | T1];

b_to_s([]) ->
    [].

read_udoc(Name) ->
    Lines = read_bin_lines(Name),
    b_to_s(Lines).

read_doc(Name) ->
    Words = read_bin_words(Name),
    b_to_s(Words).