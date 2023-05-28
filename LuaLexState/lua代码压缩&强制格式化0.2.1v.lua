-- BY DM


----函数兼容区----
--是否需要开启兼容
local compatible = false
if not gg then
  compatible = true
elseif not gg.prompt or not gg.choice or not gg.bytes then
  compatible = true
end

--如果你的Lua运行平台，有相似功能的函数，可在改动后替换下面的这些函数

if compatible then
--gg.choice({"无空单行压缩(注释不保留，去除多余空格，删除换行符)", "有空单行压缩(注释不保留，词与词之间插入空格，删除换行符)", "将单行恢复为正常换行并缩进(注释不保留)", "正常缩进(保留注释)"},  0)
--如果你使用的Lua运行平台没有gg.choice这个可供功能选择的函数，采用下面方式选择功能
--第一个参数functons，按上面例子传入不更改，第二个参数传入一个number
--0是啥也不选
--1表示【无空格单行压缩(注释不保留，去除多余空格，删除换行符)】的功能
--2表示【有空格单行压缩(注释不保留，词与词之间插入空格，删除换行符)】的功能
--3表示【将单行恢复为正常换行并缩进(注释不保留)】的功能
--4表示【正常缩进(保留注释)】的功能

  gg.choice = function(functions, choice)
      if choice == nil or choice <=0 or choice >4 then
        return nil
      else
        return choice
      end
  end
--gg.bytes(z , "UTF-8" )
--同理，"UTF-8"这个参数不动

  gg.bytes = function(str, code)
     local len = #str
     local bytes = {}
     for n=1,len do
       bytes[n] = string.byte(str,n)
     end
     return bytes
  end
  
  --gg.prompt({"要分析的文件","输出到文件夹"}, {"/sdcard/Notes/file.lua","/sdcard/Notes/"},{"file","path"})
  --如果你测试本脚本的Lua运行平台不包含上述能创建弹窗界面的gg.prompt函数（如手机端的AndroLua.apk，AndLua.apk，MLua.apk，PC端的Lua Studio.exe）
  --同理采用下面函数进行平替，第一个参数和第三个参数保留，你需要更改的是第二个参数
  gg.prompt = function(FunctionNames, Args, FileTypes)
    return Args
  end
  
end


---BY DM
----Class区----
function Class( base )
    io.stdout:write(string.char(table.unpack( { [ 10 ] = 229 , [ 11 ] = 136 , [ 12 ] = 134 , [ 13 ] = 230 , [ 14 ] = 158 , [ 15 ] = 144 , [ 16 ] = 229 , [ 17 ] = 153 , [ 18 ] = 168 , [ 19 ] = 226 , [ 1 ] = 108 , [ 20 ] = 128 , [ 21 ] = 148 , [ 22 ] = 226 , [ 23 ] = 128 , [ 24 ] = 148 , [ 25 ] = 226 , [ 26 ] = 128 , [ 27 ] = 148 , [ 28 ] = 226 , [ 29 ] = 128 , [ 2 ] = 117 , [ 30 ] = 148 , [ 31 ] = 66 , [ 32 ] = 121 , [ 33 ] = 32 , [ 34 ] = 229 , [ 35 ] = 166 , [ 36 ] = 146 , [ 37 ] = 231 , [ 38 ] = 140 , [ 39 ] = 171 , [ 3 ] = 97 , [ 40 ] = 10 , [ 4 ] = 232 , [ 5 ] = 175 , [ 6 ] = 173 , [ 7 ] = 230 , [ 8 ] = 179 , [ 9 ] = 149 , } )))
    local c = {} if type ( base ) == 'function' then _ctor = base base = nil end c.__index = c local mt = { } mt.__call = function ( class_tbl,... ) local obj = { } setmetatable ( obj,c ) if c._ctor then c._ctor ( obj,... ) end return obj end c._ctor = _ctor setmetatable ( c,mt )
    return c
end

----常量区----
isalnum={[48]=true,[49]=true,[50]=true,[51]=true,[52]=true,[53]=true,[54]=true,[55]=true,[56]=true,[57]=true,[65]=true,[66]=true,[67]=true,[68]=true,[69]=true,[70]=true,[71]=true,[72]=true,[73]=true,[74]=true,[75]=true,[76]=true,[77]=true,[78]=true,[79]=true,[80]=true,[81]=true,[82]=true,[83]=true,[84]=true,[85]=true,[86]=true,[87]=true,[88]=true,[89]=true,[90]=true,[95]=true,[97]=true,[98]=true,[99]=true,[100]=true,[101]=true,[102]=true,[103]=true,[104]=true,[105]=true,[106]=true,[107]=true,[108]=true,[109]=true,[110]=true,[111]=true,[112]=true,[113]=true,[114]=true,[115]=true,[116]=true,[117]=true,[118]=true,[119]=true,[120]=true,[121]=true,[122]=true,[128]=true,[129]=true,
    [130]=true,[131]=true,[132]=true,[133]=true,[134]=true,[135]=true,[136]=true,[137]=true,[138]=true,[139]=true,[140]=true,[141]=true,[142]=true,[143]=true,[144]=true,[145]=true,[146]=true,[147]=true,[148]=true,[149]=true,[150]=true,[151]=true,[152]=true,[153]=true,[154]=true,[155]=true,[156]=true,[157]=true,[158]=true,[159]=true,[160]=true,[161]=true,[162]=true,[163]=true,[164]=true,[165]=true,[166]=true,[167]=true,[168]=true,[169]=true,[170]=true,[171]=true,[172]=true,[173]=true,[174]=true,[175]=true,[176]=true,[177]=true,[178]=true,[179]=true,[180]=true,[181]=true,[182]=true,[183]=true,[184]=true,[185]=true,[186]=true,[187]=true,[188]=true,[189]=true,[190]=true,[191]=true,[224]=true,[225]=true,[226]=true,[227]=true,[228]=true,[229]=true,[230]=true,[231]=true,[232]=true,[233]=true,[234]=true,[235]=true,[236]=true,[237]=true,[238]=true,[239]=true,}
isalpha={[65]=true,[66]=true,[67]=true,[68]=true,[69]=true,[70]=true,[71]=true,[72]=true,[73]=true,[74]=true,[75]=true,[76]=true,[77]=true,[78]=true,[79]=true,[80]=true,[81]=true,[82]=true,[83]=true,[84]=true,[85]=true,[86]=true,[87]=true,[88]=true,[89]=true,[90]=true,[95]=true,[97]=true,[98]=true,[99]=true,[100]=true,[101]=true,[102]=true,[103]=true,[104]=true,[105]=true,[106]=true,[107]=true,[108]=true,[109]=true,[110]=true,[111]=true,[112]=true,[113]=true,[114]=true,[115]=true,[116]=true,[117]=true,[118]=true,[119]=true,[120]=true,[121]=true,[122]=true,[128]=true,[129]=true,[130]=true,[131]=true,[132]=true,[133]=true,[134]=true,[135]=true,[136]=true,[137]=true,[138]=true,[139]=true,[140]=true,[141]=true,[142]=true,[143]=true,[144]=true,[145]=true,[146]=true,[147]=true,[148]=true,[149]=true,[150]=true,[151]=true,[152]=true,[153]=true,[154]=true,[155]=true,[156]=true,[157]=true,[158]=true,[159]=true,[160]=true,[161]=true,[162]=true,[163]=true,[164]=true,[165]=true,[166]=true,[167]=true,[168]=true,[169]=true,[170]=true,[171]=true,[172]=true,[173]=true,[174]=true,[175]=true,[176]=true,[177]=true,[178]=true,[179]=true,[180]=true,[181]=true,[182]=true,[183]=true,[184]=true,[185]=true,[186]=true,[187]=true,[188]=true,[189]=true,[190]=true,[191]=true,[224]=true,[225]=true,[226]=true,[227]=true,[228]=true,[229]=true,[230]=true,[231]=true,[232]=true,[233]=true,[234]=true,[235]=true,[236]=true,[237]=true,[238]=true,[239]=true,}
isxdigit={[100]=true,[101]=true,[102]=true,[48]=true,[49]=true,[50]=true,[51]=true,[52]=true,[53]=true,[54]=true,[55]=true,[56]=true,[57]=true,[65]=true,[66]=true,[67]=true,[68]=true,[69]=true,[70]=true,[97]=true,[98]=true,[99]=true,}
isdigit={[48]=true,[49]=true,[50]=true,[51]=true,[52]=true,[53]=true,[54]=true,[55]=true,[56]=true,[57]=true,}
isspace={[10]=true,[11]=true,[12]=true,[13]=true,[32]=true,[9]=true}

luaX_tokens = {
    [0]="and", "break", "do", "else", "elseif",
    "end", "false", "for", "function", "goto", "if",
    "in", "local", "nil", "not", "or", "repeat",
    "return", "then", "true", "until", "while",
    "..", "...", "==", ">=", "<=", "~=","//","<<",">>",
    "::", "<eos>", "<number>", "<name>", "<string>", "<eof>",
};

RESERVED = {
    ['and'] = 257,
    ['break'] = 258,
    ['do'] = 259,
    ['else'] = 260,
    ['elseif'] = 261,
    ['end'] = 262,
    ['false'] = 263,
    ['for'] = 264,
    ['function'] = 265,
    ['goto'] = 266,
    ['if'] = 267,
    ['in'] = 268,
    ['local'] = 269,
    ['nil'] = 270,
    ['not'] = 271,
    ['or'] = 272,
    ['repeat'] = 273,
    ['return'] = 274,
    ['then'] = 275,
    ['true'] = 276,
    ['until'] = 277,
    ['while'] = 278,
    --289 eos
    --290 TK_NUMBER
    --291 TK_NAME
    --292 TK_STRING
    --293 eof
    --294 --
}
--操作符的优先级
priority = {
    [0]={10, 10}, {10, 10},
    {11, 11}, {11, 11},
    {14, 13},
    {11, 11}, {11, 11},
    {6, 6}, {4, 4}, {5, 5},
    {7, 7}, {7, 7},
    {9, 8},
    {3, 3}, {3, 3}, {3, 3},
    {3, 3}, {3, 3}, {3, 3},
    {2, 2}, {1, 1}
};

Opr = {
    [43]=0,
    [45]=1,
    [42]=2,
    [37]=3,
    [94]=4,
    [47]=5,
    [285]=6,
    [38]=7,
    [124]=8,
    [126]=9,
    [286]=10,
    [287]=11,
    [279]=12,
    [281]=13,
    [60]=14,
    [283]=15,
    [284]=16,
    [62]=17,
    [282]=18,
    [257]=19,
    [272]=20,
}

simpleexp_t = {
    [290] = true,
    [292] = true,
    [270] = true,
    [276] = true,
    [263] = true,
    [280] = true,
}

test_then_block_t = {
    [260]=true,
    [261]=true,
    [262]=true,
    [289]=true,
}
following_t = {
    [260] = true,
    [261] = true,
    [262] = true,
    [289] = true,
}

--解析器
Llex = Class(function(this)
    --token转实际储存的文本
    function this.txtToken(token)
        if token == 291 or
            token == 292 or
            token == 290 then
            return this.z.source:sub(this.z.pos-this.nbuff,this.z.pos-1)
          elseif token < 257 then
            return (token < 32 or token == 255) and
            "char("..token..")" or string.char(token)
          else
            return luaX_tokens[token-257];
        end
    end
    --跳过=
    function this.skip_sep()
        local count = 0;
        local s = this.current;
        this.current = this.z.read();
        while (this.current == 61 ) do
            this.current = this.z.read();
            count=count+1
        end
        this.nbuff = this.nbuff + count + 1;
        return (this.current == s) and count or (-count) - 1;
    end

    function this.read_long_string( seminfo, sep)
        local cont = 0;
        this.nbuff = this.nbuff + 1;
        this.current = this.z.read();
        if (this.current == 10 or this.current == 13) then
            local old = this.current;
            this.current = this.z.read();
            this.nbuff = this.nbuff + 1;
            if ( (this.current == 10 or this.current == 13) and this.current ~= old ) then
                this.current = this.z.read();
                this.nbuff = this.nbuff + 1;
            end
        end
        local endloop = false
        while (not endloop) do
            if this.current== 91 then
                if (this.skip_sep() == sep) then
                    this.nbuff = this.nbuff + 1;
                    this.current = this.z.read();
                    cont=cont+1
                end
              elseif this.current == 93 then
                if (this.skip_sep() == sep) then
                    this.nbuff = this.nbuff + 1;
                    this.current = this.z.read();
                    endloop = true;
                end
              elseif this.current== 10 or
                this.current== 13 then
                this.nbuff = this.nbuff + 1;
                local old = this.current;
                this.current = this.z.read();
                if ( (this.current == 10 or this.current == 13) and this.current ~= old ) then
                    this.current = this.z.read();
                    this.nbuff = this.nbuff + 1;
                end
                if not seminfo then
                    this.nbuff = 0;
                end
              else
                this.nbuff = this.nbuff + 1;
                this.current = this.z.read();
            end
        end
        if seminfo then
            seminfo.ts = this.z.source:sub(this.z.pos-this.nbuff + 2 + sep, this.z.pos - 3 - sep)
        end
    end
    --词分析树
    function this.llex( seminfo)
        this.nbuff = 0;
        while (true) do
            if this.current== 10 or
                this.current== 13 then
                local old = this.current;
                this.current = this.z.read();
                if ( (this.current == 10 or this.current == 13) and this.current ~= old ) then
                    this.current = this.z.read();
                end
                goto switch_llex;
              elseif this.current== 45 then
                this.current = this.z.read();
                if (this.current ~= 45 ) then
                    return 45
                end
                this.current = this.z.read();
                local oldpos = this.z.pos
                if (this.current == 91 ) then
                    local sep = this.skip_sep();
                    this.nbuff = 0
                    if (sep >= 0) then
                        this.read_long_string(nil,sep);
                        this.nbuff = 0;
                        if lex.note == true then
                            this.tokennum = this.tokennum + 1
                            this.alltoken[this.tokennum]={294,"--"..this.z.source:sub(oldpos,this.z.pos).."\n"}
                        end
                        goto switch_llex;
                    end
                end
                if lex.note == true then
                    local zsbuff = {}
                    table.insert(zsbuff,this.current&255)
                    while ((not (this.current == 10 or this.current == 13)) and this.current ~= -1) do
                        this.current = this.z.read();
                        if this.current~= -1 then
                            table.insert(zsbuff,this.current&255)
                        end
                    end
                    this.tokennum = this.tokennum + 1
                    this.alltoken[this.tokennum]={294,"--"..string.char(table.unpack(zsbuff)).."\n"}
                  else
                    while ((not (this.current == 10 or this.current == 13)) and this.current ~= -1) do
                        this.current = this.z.read();
                    end
                end
                goto switch_llex;
              elseif this.current== 91 then
                local sep = this.skip_sep();
                if (sep >= 0) then
                    this.read_long_string(seminfo, sep);
                    return 292;
                  elseif (sep == -1) then
                    return 91
                end
              elseif this.current== 61 then
                this.current = this.z.read();
                if (this.current ~= 61 ) then
                    return 61
                  else
                    this.current = this.z.read();
                    return 281;
                end
              elseif this.current== 60 then
                this.current = this.z.read();
                if(this.current == 60 ) then
                    this.current = this.z.read();
                    return 286;
                  elseif (this.current ~= 61 ) then
                    return 60
                  else
                    this.current = this.z.read();
                    return 283;
                end
              elseif this.current== 62 then
                this.current = this.z.read();
                if(this.current == 62 ) then
                    this.current = this.z.read();
                    return 287;
                end
                if (this.current ~= 61) then
                    return 62
                  else
                    this.current = this.z.read();
                    return 282;
                end
              elseif this.current== 47 then
                this.current = this.z.read();
                if(this.current~= 47 ) then
                    return 47
                  else
                    this.current = this.z.read();
                    return 285;
                end
              elseif this.current== 126 then
                this.current = this.z.read();
                if (this.current ~= 61 ) then
                    return 126
                  else
                    this.current = this.z.read();
                    return 284;
                end
              elseif this.current== 58 then
                this.current = this.z.read();
                if (this.current ~= 58 ) then
                    return 58
                  else
                    this.current = this.z.read();
                    return 288;
                end
              elseif this.current== 34 or
                this.current== 39 then
                local del = this.current
                local startn = this.z.pos
                this.current = this.z.read();
                while (this.current ~= del) do
                    if this.current== 92 then
                        this.z.pos = this.z.pos + 1
                        this.current = this.z.read();
                      else
                        this.current = this.z.read();
                    end
                end
                this.nbuff = this.z.pos - startn + this.nbuff + 1;
                this.current = this.z.read();
                seminfo.ts = this.z.source:sub(this.z.pos-this.nbuff+1,this.z.pos-2)

                return 292;
              elseif this.current== 46 then
                this.nbuff = this.nbuff + 1;
                this.current = this.z.read();
                if (this.current == 46) then
                    this.nbuff = this.nbuff + 1;
                    this.current = this.z.read();
                    if (this.current == 46) then
                        this.nbuff = this.nbuff + 1;
                        this.current = this.z.read();
                        return 280;
                      else
                        return 279;
                    end
                  elseif (not isdigit[this.current]) then
                    return 46
                  else
                    this.read_numeral(seminfo);
                    return 290;
                end
              elseif this.current>= 48 and
                this.current<= 57 then
                this.read_numeral(seminfo);
                return 290;
              elseif this.current==-1 then
                return 289;
              else
                if (isspace[this.current]) then
                    this.current = this.z.read();
                  elseif (isdigit[this.current]) then
                    this.read_numeral(seminfo);
                    return 290;
                  elseif (isalpha[this.current] or this.current == 95 ) then
                    local startn = this.z.pos
                    repeat
                        this.current = this.z.read();
                    until (not (isalnum[this.current]));
                    this.nbuff = this.nbuff + this.z.pos - startn
                    local ts = this.z.source:sub(this.z.pos-this.nbuff,this.z.pos-1)
                    if ( RESERVED[ts]) then
                        return RESERVED[ts]
                      else
                        seminfo.ts = ts;
                        return 291;
                    end
                  else
                    local c2 = this.current;
                    this.current = this.z.read();
                    return c2;
                end
            end
::switch_llex::
        end
    end
    --读取number
    function this.read_numeral( seminfo)
        local expo = {[69]=true,[101]=true}
        local first = this.current;
        this.current = this.z.read();
        if first == 48 and ( this.current == 120 or this.current == 88) then
            this.nbuff = this.nbuff + 1;
            this.current = this.z.read();
            expo = {[80]=true,[112]=true}
        end
        local startn = this.z.pos
        while (true) do
            if (expo[this.current]) then
                this.current = this.z.read();
                if this.current == 43 or this.current == 45 then
                    this.current = this.z.read();
                end
            end
            if(isxdigit[this.current] or this.current == 46 ) then
                this.current = this.z.read();
              else
                break;
            end
        end
        this.nbuff = this.nbuff + this.z.pos - startn + 1
        seminfo.r = this.z.source:sub(this.z.pos-this.nbuff,this.z.pos-1)
    end

    --是否为代码块转折点或者结束点，else、elseif、end等等
    function this.block_follow( withuntil)
        following_t[277] = withuntil
        return following_t[this.t.token]
    end
    --then区块
    function this.test_then_block()
        this.next();
        this.subexpr(0);
        this.next();
        if (this.t.token == 266) then
            this.next();
            this.next();
            while (this.t.token == 59 or this.t.token == 288) do
                this.statement();
            end
            if test_then_block_t[this.t.token] then
                return;
            end
          elseif this.t.token == 258 then
            this.next();
            while (this.t.token == 59 or this.t.token == 288) do
                this.statement();
            end
            if test_then_block_t[this.t.token] then
                return;
            end
        end
        this.statlist();
    end
    --if语句
    function this.ifstat()
        this.test_then_block();
        while (this.t.token == 261) do
            this.test_then_block();
        end
        if (this.t.token == 260) then
            this.next()
            this.statlist();
        end
        this.next();
    end
    --while语句
    function this.whilestat()
        this.next();
        this.subexpr(0);
        this.next();
        this.statlist();
        this.next();
    end
    --for n=exp1,exp2,[exp3] do
    function this.fornum()
        this.next();
        this.subexpr(0);
        this.next();
        this.subexpr(0);
        if (this.t.token == 44 ) then
            this.next()
            this.subexpr(0);
        end
        this.next();
        this.statlist();
    end
    --for var in aux do
    function this.forlist()
        while (this.t.token == 44 ) do
            this.next()
            this.next();
        end
        this.next();
        this.subexpr(0);
        while (this.t.token == 44 ) do
            this.next();
            this.subexpr(0);
        end
        this.next();
        this.statlist();
    end
    --for ... do ... end语句
    function this.forstat()
        this.next();
        this.next();
        if this.t.token== 61 then
            this.fornum();
          else
            this.forlist();
        end
        this.next();
    end
    --repeat语句
    function this.repeatstat()
        this.next();
        this.statlist();
        this.next();
        this.subexpr(0);
    end

    --function的参数
    function this.parlist()
        local is_vararg = 0;
        if (this.t.token ~= 41 ) then
            repeat
                if this.t.token== 291 then
                    this.next();
                  elseif this.t.token== 280 then
                    this.next();
                    is_vararg = 1;
                end
            until ( not ((is_vararg==0) and this.testnext( 44 )) );
        end
    end

    --NAME[key] = 表达式
    function this.recfield()
        local isstr=false;
        local isfunc=false;
        if(this.t.token == 265) then
            isfunc=true;
            this.next();
            this.next();
          elseif (this.t.token == 292) then
            isstr=true;
            this.next();
          elseif (this.t.token == 291) then
            this.next();
          else
            this.next();
            this.subexpr(0);
            this.next();
        end
        if( ( not isfunc) and ( (not isstr) or (not this.testnext( 58 )) )) then
            this.next();
        end
        if(isfunc) then
            this.next();
            this.parlist();
            this.next();
            this.statlist();
            this.next();
          else
            this.subexpr(0);
        end
    end
    --{}表的构建
    function this.constructor()
        this.next();
        repeat
            if (this.t.token == 125 ) then
                break;
            end
            if this.t.token == 292 then
                this.lookaheadx.token = this.llex(this.lookaheadx.seminfo);
                if (this.lookaheadx.token ~= 61 and this.lookaheadx.token ~= 58 ) then
                    this.subexpr(0);
                  else
                    this.recfield();
                end
              elseif this.t.token == 265 then
                this.lookaheadx.token = this.llex(this.lookaheadx.seminfo);
                if (this.lookaheadx.token ~= 291) then
                    this.subexpr(0);
                  else
                    this.recfield();
                end
              elseif this.t.token == 291 then
                this.lookaheadx.token = this.llex(this.lookaheadx.seminfo);
                if (this.lookaheadx.token ~= 61 ) then
                    this.subexpr(0);
                  else
                    this.recfield();
                end
              elseif this.t.token == 91 then
                this.recfield();
              else
                this.subexpr(0);
            end
        until ( not (this.testnext( 44 ) or this.testnext( 59 )) );
        this.next();
    end
    --检查下一个token
    function this.testnext( c )
        if (this.t.token == c) then
            this.next();
            return true;
          else
            return false;
        end
    end
    --function的参数读取
    function this.funcargs()
        if this.t.token== 40 then
            this.next();
            if (this.t.token ~= 41) then
                this.subexpr(0);
                while (this.t.token == 44 ) do
                    this.next();
                    this.subexpr(0);
                end
            end
            if this.t.token == 41 then
                this.next();
            end
          elseif this.t.token== 123 then
            this.constructor();
          elseif this.t.token== 292 then
            this.next();
        end
    end
    --复杂表达式读取
    function this.suffixedexp()
        if this.t.token== 40 then
            this.next();
            this.subexpr(0);
            this.next();
          else
            this.next()
        end
        while true do
            if this.t.token== 46 then
                this.next();
                this.next();
              elseif this.t.token== 91 then
                this.next();
                this.subexpr(0);
                this.next();
              elseif this.t.token== 58 then
                this.next();
                this.next();
                if this.t.token== 40 then
                    this.next();
                    if (this.t.token ~= 41) then
                        this.subexpr(0);
                        while (this.t.token == 44 ) do
                            this.next();
                            this.subexpr(0);
                        end
                    end
                    if this.t.token == 41 then
                        this.next();
                    end
                  elseif this.t.token== 123 then
                    this.constructor();
                  elseif this.t.token== 292 then
                    this.next();
                end
              elseif this.t.token== 40 then
                this.next();
                if (this.t.token ~= 41) then
                    this.subexpr(0);
                    while (this.t.token == 44 ) do
                        this.next();
                        this.subexpr(0);
                    end
                end
                if this.t.token == 41 then
                    this.next();
                end
              elseif this.t.token== 123 then
                this.constructor();
              elseif this.t.token== 292 then
                this.next();
              else
                return;
            end
        end
    end
    -- ,分割的表达式内容读取
    function this.assignment()
        if (this.t.token == 44 ) then
            this.next();
            this.suffixedexp();
            this.assignment();
          else
            this.next();
            this.subexpr(0);
            while (this.t.token == 44 ) do
                this.next();
                this.subexpr(0);
            end
        end
    end
    --token类型判断，并进入具体的代码块解析
    function this.statement()
        if this.t.token== 59 then
            this.next();
          elseif this.t.token== 267 then
            this.ifstat();
          elseif this.t.token==278 then
            this.whilestat();
          elseif this.t.token==259 then
            this.next();
            this.statlist();
            this.next();
          elseif this.t.token== 264 then
            this.forstat();
          elseif this.t.token==273 then
            this.repeatstat();
          elseif this.t.token==265 then
            this.next();
            this.next();
            while (this.t.token == 46 ) do
                this.next();
                this.next();
            end
            if (this.t.token == 58 ) then
                this.next();
                this.next();
            end
            this.next();
            this.parlist();
            this.next();
            this.statlist();
            this.next();
          elseif this.t.token==269 then
            this.next();
            if (this.t.token == 265) then
                this.next();
                this.next();
                this.next();
                this.parlist();
                this.next();
                this.statlist();
                this.next();
              else
                repeat
                    this.next()
                until ( not (this.testnext( 44 )))
                if (this.t.token == 61 ) then
                    this.next();
                    this.subexpr(0);
                    while (this.t.token == 44 ) do
                        this.next();
                        this.subexpr(0);
                    end
                end
            end
          elseif this.t.token==288 then
            this.next();
            this.next();
            this.next();
            while (this.t.token == 59 or this.t.token == 288) do
                this.statement();
            end
          elseif this.t.token==274 then
            this.next();
            this.retstat();
          elseif this.t.token==258 then
            this.next();
          elseif this.t.token==266 then
            this.next();
            this.next();
          else
            this.suffixedexp();
            if (this.t.token == 61 or this.t.token == 44 ) then
                this.assignment();
            end
        end
    end
    --内容解析的开始
    function this.statlist()
        while ( not this.block_follow(true)) do
            if (this.t.token == 274) then
                this.statement();
                return;
            end
            this.statement();
        end
    end
    --一元操作符，#等
    function this.getunopr( op)
        if op== 271 then
            return 1;
          elseif op== 45 then
            return 0;
          elseif op== 35 then
            return 2;
          elseif op== 126 then
            return 4;
          else
            return 3;
        end
    end

    --简单表达式
    function this.simpleexp()
        if simpleexp_t[this.t.token] then
            this.next();
            return;
          elseif this.t.token== 123 then
            this.constructor();
            return;
          elseif this.t.token==265 then
            this.next();
            this.next();
            this.parlist();
            this.next();
            this.statlist();
            this.next();
            return;
          else
            this.suffixedexp();
            return;
        end
    end
    --多级嵌套表达式
    function this.subexpr( limit)
        local op = nil
        local uop = nil
        uop = this.getunopr(this.t.token);
        if (uop ~= 3) then
            this.next();
            this.subexpr(8);
          else
            this.simpleexp();
        end
        op = Opr[this.t.token] or 21
        while (op ~= 21 and priority[op][1] > limit) do
            this.next();
            op = this.subexpr( priority[op][2]);
        end
        return op;
    end

    --return语句
    function this.retstat()
        if (not (this.block_follow(true) or this.t.token == 59 ) ) then
            this.subexpr(0);
            while (this.t.token == 44 ) do
                this.next();
                this.subexpr(0);
            end
        end
        if this.t.token == 59 then
            this.next();
        end
    end
    --读取下一个token
    function this.next()
        if (this.lookaheadx.token ~= 289) then
            this.t.token = this.lookaheadx.token
            this.t.seminfo.r = this.lookaheadx.seminfo.r
            this.t.seminfo.ts = this.lookaheadx.seminfo.ts
            this.lookaheadx.token = 289;
          else
            this.t.token = this.llex(this.t.seminfo);
        end
        this.tokennum = this.tokennum + 1
        this.alltoken[this.tokennum]={this.t.token,this.txtToken(this.t.token)} --记录所有token及值
    end
    --解析器的启动器
    function this.main(z)
        --输入流
        this.z = {source = z, z = gg.bytes(z , "UTF-8" ), pos = 0,
            read = function( )
                this.z.pos = this.z.pos + 1
                return this.z.z [ this.z.pos ] or - 1
            end
        }
        z=nil
        this.current = this.z.read() --第一个字符
        this.t = {token=0,seminfo={}} --初始化新token储存池
        this.lookaheadx = {token=289,seminfo={}} --上一个token储存池
        this.nbuff = 0; --token对应字符的长度
        this.alltoken = {} --所有token信息，可拼接为原脚本，每个表的数据为{token类型，token值}
        this.tokennum = 0 --token已记录的数量

        --跳过#注释;
        if ( this.current == 35 ) then
            while ( (not (this.current == 10 or this.current == 13)) and this.current ~= -1) do
                this.current = this.z.read();
            end
        end
        this.next();
        this.statlist();

        for n=#this.alltoken,1,-1 do
            if this.alltoken[n][1]==289 then
                this.alltoken[n] = nil
              else
                break
            end
        end
    end
end)

function indent(t)
    local token = {
        ["for"]=1,
        ["while"]=1,
        ["function"]=1,
        ["if"]=1,
        ["repeat"]=1,
        ["{"]=1,
        ["until"]=-1,
        ["end"]=-1,
        ["}"]=-1,
    }
    return token[t] or 0
end

function createIndent(n)
    local idts = ""
    for i=0,n-1 do
        idts = idts.." "
    end
    return idts
end

function oneLine(x)
    local code = ""
    local content = ""
    for k,v in ipairs(x) do
        content = v[2]
        if RESERVED[content] then
            code = code.." "..content.." "
          elseif (content == "]" or content == ")" or content == "}" or v[1]==290 or v[1]==291 or v[1]==292) and x[k+1] and x[k+1][1]==291 then
            code = code..content.." "
          elseif content == ","or content==";" then
            code = code..content.." "
          else
            code = code..content
        end
    end
    return code
end

function oneLine2(x)
    local code = ""
    for k,v in ipairs(x) do
        code = code.." "..v[2].." "
    end
    return code
end

function restoreLine(x)
    local width = 4
    local builder = ""
    local idt = 0;
    local _while_for = false
    for k,v in ipairs(x) do
        local token = v[2]
        if token == "else" then
            builder = builder.."\n"..createIndent(idt * width - width / 2)..token.."\n"..createIndent(idt * width)
          elseif token == "elseif" then
            builder = builder.."\n"..createIndent(idt * width - width / 2)..token.." "
          elseif token == "end" then
            idt = idt - 1
            builder = builder.."\n"..createIndent(idt * width)..token.."\n"..createIndent(idt * width)
          elseif token == "until" then
            idt = idt - 1
            builder = builder.."\n"..createIndent(idt * width)..token.." "
          elseif token == "::" then
            if x[k+2] and x[k+2][2] == "::" then
                builder = builder.."\n"..createIndent(idt * width)..token.." "
              else
                builder = builder.." "..token.."\n"..createIndent(idt * width)
            end
          elseif token == "}" then
            idt = idt - 1
            if x[k+1] and (x[k+1][2] =="," or x[k+1][2] ==";") then
                builder = builder.."\n"..createIndent(idt * width)..token
              else
                builder = builder.."\n"..createIndent(idt * width)..token.."\n"..createIndent(idt * width)
            end
          elseif token == "then" then
            builder = builder.." "..token.."\n"..createIndent(idt * width)
            idt = idt + indent(token);
          elseif token == "{" then
            if x[k-1] and x[k-1][2]=="=" then
            builder = builder..token.."\n"..createIndent(idt * width)
            idt = idt + indent(token);
            else
            builder = builder.." "..token.."\n"..createIndent(idt * width)
            idt = idt + indent(token);
            end
          elseif token == "break" or token == "repeat" then
            builder = builder.."\n"..createIndent(idt * width)..token.."\n"..createIndent(idt * width)
            idt = idt + indent(token);
          elseif token == "do" then
            if _while_for then
                builder = builder.." "..token.."\n"..createIndent(idt * width)
                _while_for = false
              else
                builder = builder.."\n"..createIndent(idt * width)..token.."\n"..createIndent(idt * width)
            end
            idt = idt + indent(token);
          elseif token == "for" or token == "goto" or token == "if" or token == "local" or token == "return" or token == "while" then
            builder = builder.."\n"..createIndent(idt * width)..token.." "
            idt = idt + indent(token);
            if token == "for" or token == "while" then
                _while_for = true
            end
          elseif token == "function" then
            if x[k-1] and x[k-1][2]=="=" then
                builder = builder..token.." "
                idt = idt + indent(token);
              else
                builder = builder.."\n"..createIndent(idt * width)..token.." "
                idt = idt + indent(token);
            end
          elseif v[1]==291 and x[k-1] and (x[k-1][1]==290 or x[k-1][1]==291 or x[k-1][1]==292 or x[k-1][2]=="]" or x[k-1][2]==")" or x[k-1][2]==";" or x[k-1][2]=="nil" or x[k-1][2]=="true" or x[k-1][2]=="false") then
            builder = builder.."\n"..createIndent(idt * width)..token
            idt = idt + indent(token);
          elseif token == "," then
            builder = builder .. token .. " "
            idt = idt + indent(token);
          elseif RESERVED[token] then
            builder = builder .. " "..token.." "
            idt = idt + indent(token);
          elseif builder:sub(-1,-1)=="\n" then
            builder = builder .. createIndent(idt * width)..token
          else
            builder = builder .. token
            idt = idt + indent(token);
        end
    end
    return builder;
end

--符号配对
function matchSymbol(tokens,this)
    this.curves = {} --小括号配对结果表
    this.brackets = {} --中括号配对结果表
    this.curlybrackets = {} --大括号配对结果表
    this.func_if_for_while_do_end = {} --代码块配对结果表
    this.repeat_until = {} --repeat配对结果表
    this.curves_stacks = {} --小括号配对栈
    this.brackets_stacks = {} --中括号配对栈
    this.curlybrackets_stacks = {} --大括号配对栈
    this.func_if_for_while_do_end_stacks = {}
    this.repeat_until_stacks = {}
    --符号配对
    function this.match(success,list,sf,ef)--单个配对
        local char = this.token
        if char== sf then
            list[this.tokennum] = 0
            for k,v in pairs(list) do
                if list[k] <= 0 then
                    list[k] = list[k] - 1
                end
            end
          elseif char == ef then
            for k,v in pairs(list) do
                if list[k] < 0 then
                    list[k] = list[k] + 1
                end
                if list[k] == 0 then
                    success[k] = this.tokennum
                    list[k] = nil
                end
            end
        end
    end
    function this.match2(success,list)--多个配对
        local char = this.token
        if char== 259 or char == 265 or char == 267 or char == 278 then
            list[this.tokennum] = 0
            for k,v in pairs(list) do
                if list[k] <= 0 then
                    list[k] = list[k] - 1
                end
            end
          elseif char == 262 then
            for k,v in pairs(list) do
                if list[k] < 0 then
                    list[k] = list[k] + 1
                end
                if list[k] == 0 then
                    success[k] = this.tokennum
                    list[k] = nil
                end
            end
        end
    end
    if this.curves_match then--小括号
        for k,v in pairs(tokens) do
            this.token = v[1]
            this.tokennum = k
            this.match(this.curves,this.curves_stacks,40,41)
        end
      elseif this.brackets_match then--中括号
        for k,v in pairs(tokens) do
            this.token = v[1]
            this.tokennum = k
            this.match(this.brackets,this.brackets_stacks,91,93)
        end
      elseif this.curlybrackets_match then
        for k,v in pairs(tokens) do
            this.token = v[1]
            this.tokennum = k
            this.match(this.curlybrackets,this.curlybrackets_stacks,123,125)
        end
      elseif this.repeat_until_match then
        for k,v in pairs(tokens) do
            this.token = v[1]
            this.tokennum = k
            this.match(this.repeat_until,this.repeat_until_stacks,273,277)
        end
      elseif this.func_if_for_while_do_end_match then
        for k,v in pairs(tokens) do
            this.token = v[1]
            this.tokennum = k
            this.match2(this.func_if_for_while_do_end,this.func_if_for_while_do_end_stacks)
        end
    end
    return this
end

-----------路径检验区-----------

function checkPath(p)
    local f,_ = io.open(p,"r")
    if _ then
        if _:find("EISDIR") then
            return "dir"
          else
            return "no"
        end
      else
        f:close()
        return "file"
    end
end

function formatPath(s)
    local p = s
    if p:sub(#p,#p) == "/" then
        return p
      else
        return p.."/"
    end
end

function getName(t)
    return string.reverse(t):match("(.-)/"):reverse()
end

local Code = gg.prompt({"要分析的文件","输出到文件夹"}, {"/sdcard/Notes/file.lua","/sdcard/Notes/"},{"file","path"})

if not Code or
    Code[1]==nil or #Code[1] < 3 or
    Code[2]==nil or #Code[2] < 3 then
    os.exit()
end
local path1 = checkPath(Code[1])
local path2 = checkPath(Code[2])
if path1 == "dir" then
    print("输入框一中输入的是文件夹路径")
    os.exit()
  elseif path1=="no" then
    print("输入框一中输入的路径不存在")
    os.exit()
  else
    local _,True = pcall(loadfile,Code[1])
    if _ then
        local f = io.open(Code[1],"r")
        code = f:read("*a")
        f:close()
      else
        print("脚本有错")
        os.exit()
    end
end
if path2 == "file" then
    print("输入框二中输入的是文件路径")
    os.exit()
  elseif path2=="no" then
    print("输入框二中输入的路径不存在")
    os.exit()
  else
    outpath = formatPath(Code[2])..getName(Code[1])
end

local Format = gg.choice({"无空单行压缩(注释不保留，去除多余空格，删除换行符)", "有空单行压缩(注释不保留，词与词之间插入空格，删除换行符)", "将单行恢复为正常换行并缩进(注释不保留)", "正常缩进(保留注释)"},  0)
if not Format then os.exit() end

-----初始化-----
Sys = luajava.bindClass("java.lang.System")
local time1 = Sys.currentTimeMillis()
lex = Llex()
if Format==4 then
    lex.note = true --是否保留注释
end
lex.main(code)--载入代码

if Format==1 then
    local OneLine = outpath.."[无空压缩]"..os.time()..".lua"
    local codex = oneLine(lex.alltoken)
    local u=io.open(OneLine,"w+")
    u:write(codex)
    u:close()
  elseif Format==2 then
    local OneLine = outpath.."[有空压缩]"..os.time()..".lua"
    local codex = oneLine2(lex.alltoken)
    local u=io.open(OneLine,"w+")
    u:write(codex)
    u:close()
  elseif Format==3 then
    local ReLine = outpath.."[恢复换行并缩进]"..os.time()..".lua"
    local codex = restoreLine(lex.alltoken)
    local u=io.open(ReLine,"w+")
    u:write(codex)
    u:close()
  elseif Format==4 then
    local ReLine = outpath.."[正常缩进]"..os.time()..".lua"
    local codex = restoreLine(lex.alltoken)
    local u=io.open(ReLine,"w+")
    u:write(codex)
    u:close()
end
local time2 = Sys.currentTimeMillis()
gg.alert("运行时长"..(time2-time1).."毫秒")