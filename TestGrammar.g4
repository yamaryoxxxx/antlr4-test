grammar TestGrammar;

start: dummy?? (teate dummy??)*;
dummy: .*? delim;
teate: title '手当' kakko?;
title: ~('（' | '）' | '、' | '【' | '】' | '\n')+?;
kakko: '（' detail '）';
detail: ~('（' | '）')+;
delim: '（' | '）' | '・' | '、' | '【' | '】' | '\n' | EOF;

ANY: .;
