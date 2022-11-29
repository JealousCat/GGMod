---BY DM


----语法分析区----
--C语言中的char值类型，0~255
--是否为数字类型
isalnum = {[1]=false,[2]=false,[3]=false,[4]=false,[5]=false,[6]=false,[7]=false,[8]=false,[9]=false,[10]=false,
    [11]=false,[12]=false,[13]=false,[14]=false,[15]=false,[16]=false,[17]=false,[18]=false,[19]=false,[20]=false,
    [21]=false,[22]=false,[23]=false,[24]=false,[25]=false,[26]=false,[27]=false,[28]=false,[29]=false,[30]=false,
    [31]=false,[32]=false,[33]=false,[34]=false,[35]=false,[36]=false,[37]=false,[38]=false,[39]=false,[40]=false,
    [41]=false,[42]=false,[43]=false,[44]=false,[45]=false,[46]=false,[47]=false,[48]=true,[49]=true,
    [50]=true,[51]=true,[52]=true,[53]=true,[54]=true,[55]=true,[56]=true,[57]=true,[58]=false,[59]=false,[60]=false,
    [61]=false,[62]=false,[63]=false,[64]=false,[65]=true,[66]=true,[67]=true,[68]=true,[69]=true,[70]=true,[71]=true,
    [72]=true,[73]=true,[74]=true,[75]=true,[76]=true,[77]=true,[78]=true,[79]=true,[80]=true,[81]=true,[82]=true,
    [83]=true,[84]=true,[85]=true,[86]=true,[87]=true,[88]=true,[89]=true,[90]=true,[91]=false,[92]=false,[93]=false,
    [94]=false,[95]=true,[96]=false,[97]=true,[98]=true,[99]=true,
    [100]=true,[101]=true,[102]=true,[103]=true,[104]=true,[105]=true,[106]=true,[107]=true,[108]=true,[109]=true,
    [110]=true,[111]=true,[112]=true,[113]=true,[114]=true,[115]=true,[116]=true,[117]=true,[118]=true,[119]=true,[120]=true,
    [121]=true,[122]=true,[123]=false,[124]=false,[125]=false,[126]=false,[127]=false,[128]=true,[129]=true,[130]=true,[131]=true,[132]=true,
    [133]=true,[134]=true,[135]=true,[136]=true,[137]=true,[138]=true,[139]=true,[140]=true,[141]=true,[142]=true,[143]=true,[144]=true,[145]=true,[146]=true,[147]=true,[148]=true,[149]=true,
    [150]=true,[151]=true,[152]=true,[153]=true,[154]=true,[155]=true,[156]=true,[157]=true,[158]=true,[159]=true,[160]=true,[161]=true,[162]=true,[163]=true,[164]=true,
    [165]=true,[166]=true,[167]=true,[168]=true,[169]=true,[170]=true,[171]=true,[172]=true,[173]=true,[174]=true,[175]=true,[176]=true,[177]=true,[178]=true,[179]=true,[180]=true,[181]=true,[182]=true,[183]=true,[184]=true,[185]=true,[186]=true,[187]=true,[188]=true,[189]=true,[190]=true,[191]=true,[192]=false,[193]=false,[194]=false,[195]=false,[196]=false,[197]=false,[198]=false,[199]=false,
    [200]=false,[201]=false,[202]=false,[203]=false,[204]=false,[205]=false,[206]=false,[207]=false,[208]=false,[209]=false,[210]=false,[211]=false,[212]=false,[213]=false,[214]=false,[215]=false,[216]=false,[217]=false,[218]=false,
    [219]=false,[220]=false,[221]=false,[222]=false,[223]=false,[224]=true,[225]=true,[226]=true,[227]=true,[228]=true,[229]=true,[230]=true,[231]=true,[232]=true,[233]=true,[234]=true,[235]=true,[236]=true,[237]=true,[238]=true,[239]=true,[240]=false,[241]=false,[242]=false,[243]=false,[244]=false,[245]=false,[246]=false,[247]=false,[248]=false,[249]=false,
    [250]=false,[251]=false,[252]=false,[253]=false,[254]=false,[255]=false,[0]=false,}
--是否为字符类型
isalpha = {[1]=false,[2]=false,[3]=false,[4]=false,[5]=false,[6]=false,[7]=false,[8]=false,[9]=false,
    [10]=false,[11]=false,[12]=false,[13]=false,[14]=false,[15]=false,[16]=false,[17]=false,[18]=false,[19]=false,
    [20]=false,[21]=false,[22]=false,[23]=false,[24]=false,[25]=false,[26]=false,[27]=false,[28]=false,[29]=false,
    [30]=false,[31]=false,[32]=false,[33]=false,[34]=false,[35]=false,[36]=false,[37]=false,[38]=false,[39]=false,[40]=false,[41]=false,[42]=false,[43]=false,[44]=false,[45]=false,[46]=false,[47]=false,[48]=false,[49]=false,
    [50]=false,[51]=false,[52]=false,[53]=false,[54]=false,[55]=false,[56]=false,[57]=false,[58]=false,[59]=false,[60]=false,[61]=false,[62]=false,[63]=false,[64]=false,[65]=true,[66]=true,[67]=true,[68]=true,[69]=true,[70]=true,[71]=true,
    [72]=true,[73]=true,[74]=true,[75]=true,[76]=true,[77]=true,[78]=true,[79]=true,[80]=true,[81]=true,[82]=true,[83]=true,[84]=true,[85]=true,[86]=true,[87]=true,[88]=true,[89]=true,
    [90]=true,[91]=false,[92]=false,[93]=false,[94]=false,[95]=true,[96]=false,[97]=true,[98]=true,[99]=true,[100]=true,[101]=true,[102]=true,[103]=true,[104]=true,[105]=true,[106]=true,[107]=true,[108]=true,[109]=true,[110]=true,[111]=true,[112]=true,[113]=true,[114]=true,[115]=true,[116]=true,[117]=true,[118]=true,[119]=true,
    [120]=true,[121]=true,[122]=true,[123]=false,[124]=false,[125]=false,[126]=false,[127]=false,[128]=true,[129]=true,[130]=true,[131]=true,[132]=true,[133]=true,[134]=true,[135]=true,[136]=true,[137]=true,[138]=true,[139]=true,[140]=true,[141]=true,[142]=true,[143]=true,[144]=true,[145]=true,[146]=true,[147]=true,[148]=true,[149]=true,[150]=true,[151]=true,[152]=true,[153]=true,[154]=true,[155]=true,[156]=true,[157]=true,[158]=true,[159]=true,[160]=true,[161]=true,[162]=true,
    [163]=true,[164]=true,[165]=true,[166]=true,[167]=true,[168]=true,[169]=true,[170]=true,[171]=true,[172]=true,[173]=true,[174]=true,[175]=true,[176]=true,[177]=true,[178]=true,[179]=true,[180]=true,[181]=true,[182]=true,[183]=true,[184]=true,[185]=true,[186]=true,[187]=true,[188]=true,[189]=true,[190]=true,[191]=true,[192]=false,[193]=false,[194]=false,[195]=false,[196]=false,[197]=false,[198]=false,[199]=false,[200]=false,[201]=false,[202]=false,[203]=false,[204]=false,[205]=false,
    [206]=false,[207]=false,[208]=false,[209]=false,[210]=false,[211]=false,[212]=false,[213]=false,[214]=false,[215]=false,[216]=false,[217]=false,[218]=false,[219]=false,[220]=false,[221]=false,[222]=false,[223]=false,[224]=true,[225]=true,[226]=true,[227]=true,
    [228]=true,[229]=true,[230]=true,[231]=true,[232]=true,[233]=true,[234]=true,[235]=true,[236]=true,[237]=true,[238]=true,[239]=true,[240]=false,[241]=false,[242]=false,[243]=false,[244]=false,[245]=false,[246]=false,[247]=false,[248]=false,[249]=false,
    [250]=false,[251]=false,[252]=false,[253]=false,[254]=false,[255]=false,[0]=false,}
--字符是否为十六进制
isxdigit = {[1]=false,[2]=false,[3]=false,[4]=false,[5]=false,[6]=false,[7]=false,[8]=false,[9]=false,[10]=false,[11]=false,[12]=false,[13]=false,[14]=false,[15]=false,[16]=false,[17]=false,[18]=false,[19]=false,[20]=false,[21]=false,[22]=false,[23]=false,[24]=false,
    [25]=false,[26]=false,[27]=false,[28]=false,[29]=false,[30]=false,[31]=false,[32]=false,[33]=false,[34]=false,[35]=false,[36]=false,[37]=false,[38]=false,[39]=false,[40]=false,[41]=false,[42]=false,[43]=false,[44]=false,[45]=false,[46]=false,[47]=false,[48]=true,[49]=true,
    [50]=true,[51]=true,[52]=true,[53]=true,[54]=true,[55]=true,[56]=true,[57]=true,[58]=false,[59]=false,[60]=false,[61]=false,[62]=false,[63]=false,[64]=false,[65]=true,[66]=true,[67]=true,[68]=true,[69]=true,[70]=true,[71]=false,[72]=false,[73]=false,[74]=false,
    [75]=false,[76]=false,[77]=false,[78]=false,[79]=false,[80]=false,[81]=false,[82]=false,[83]=false,[84]=false,[85]=false,[86]=false,[87]=false,[88]=false,[89]=false,[90]=false,[91]=false,[92]=false,[93]=false,[94]=false,[95]=false,[96]=false,[97]=true,[98]=true,[99]=true,
    [100]=true,[101]=true,[102]=true,[103]=false,[104]=false,[105]=false,[106]=false,[107]=false,[108]=false,[109]=false,[110]=false,[111]=false,[112]=false,[113]=false,[114]=false,[115]=false,[116]=false,[117]=false,[118]=false,[119]=false,[120]=false,[121]=false,
    [122]=false,[123]=false,[124]=false,[125]=false,[126]=false,[127]=false,[128]=false,[129]=false,[130]=false,[131]=false,[132]=false,[133]=false,[134]=false,[135]=false,[136]=false,[137]=false,[138]=false,[139]=false,[140]=false,[141]=false,[142]=false,[143]=false,[144]=false,[145]=false,[146]=false,[147]=false,[148]=false,[149]=false,
    [150]=false,[151]=false,[152]=false,[153]=false,[154]=false,[155]=false,[156]=false,[157]=false,[158]=false,[159]=false,[160]=false,[161]=false,[162]=false,[163]=false,[164]=false,[165]=false,[166]=false,[167]=false,[168]=false,[169]=false,[170]=false,[171]=false,[172]=false,[173]=false,[174]=false,[175]=false,[176]=false,[177]=false,[178]=false,
    [179]=false,[180]=false,[181]=false,[182]=false,[183]=false,[184]=false,[185]=false,[186]=false,[187]=false,[188]=false,[189]=false,[190]=false,[191]=false,[192]=false,[193]=false,[194]=false,[195]=false,[196]=false,[197]=false,[198]=false,[199]=false,
    [200]=false,[201]=false,[202]=false,[203]=false,[204]=false,[205]=false,[206]=false,[207]=false,[208]=false,[209]=false,[210]=false,[211]=false,[212]=false,[213]=false,[214]=false,[215]=false,[216]=false,[217]=false,[218]=false,[219]=false,[220]=false,[221]=false,
    [222]=false,[223]=false,[224]=false,[225]=false,[226]=false,[227]=false,[228]=false,[229]=false,[230]=false,[231]=false,[232]=false,[233]=false,[234]=false,[235]=false,[236]=false,[237]=false,[238]=false,[239]=false,[240]=false,[241]=false,[242]=false,[243]=false,[244]=false,[245]=false,[246]=false,[247]=false,[248]=false,[249]=false,
    [250]=false,[251]=false,[252]=false,[253]=false,[254]=false,[255]=false,[0]=false,}
--字符中是否为数字
isdigit={[1]=false,[2]=false,[3]=false,[4]=false,[5]=false,[6]=false,[7]=false,[8]=false,[9]=false,[10]=false,[11]=false,[12]=false,[13]=false,[14]=false,[15]=false,[16]=false,[17]=false,[18]=false,[19]=false,
    [20]=false,[21]=false,[22]=false,[23]=false,[24]=false,[25]=false,[26]=false,[27]=false,[28]=false,[29]=false,[30]=false,[31]=false,[32]=false,[33]=false,[34]=false,[35]=false,[36]=false,[37]=false,[38]=false,[39]=false,
    [40]=false,[41]=false,[42]=false,[43]=false,[44]=false,[45]=false,[46]=false,[47]=false,[48]=true,[49]=true,[50]=true,[51]=true,[52]=true,[53]=true,[54]=true,[55]=true,[56]=true,[57]=true,[58]=false,[59]=false,[60]=false,[61]=false,[62]=false,[63]=false,[64]=false,[65]=false,[66]=false,[67]=false,
    [68]=false,[69]=false,[70]=false,[71]=false,[72]=false,[73]=false,[74]=false,[75]=false,[76]=false,[77]=false,[78]=false,[79]=false,[80]=false,[81]=false,[82]=false,[83]=false,[84]=false,[85]=false,
    [86]=false,[87]=false,[88]=false,[89]=false,[90]=false,[91]=false,[92]=false,[93]=false,[94]=false,[95]=false,[96]=false,[97]=false,[98]=false,[99]=false,
    [100]=false,[101]=false,[102]=false,[103]=false,[104]=false,[105]=false,[106]=false,[107]=false,[108]=false,[109]=false,[110]=false,[111]=false,[112]=false,[113]=false,[114]=false,[115]=false,[116]=false,[117]=false,[118]=false,[119]=false,[120]=false,[121]=false,[122]=false,[123]=false,[124]=false,[125]=false,
    [126]=false,[127]=false,[128]=false,[129]=false,[130]=false,
    [131]=false,[132]=false,[133]=false,[134]=false,[135]=false,[136]=false,[137]=false,[138]=false,[139]=false,[140]=false,[141]=false,[142]=false,[143]=false,[144]=false,[145]=false,[146]=false,
    [147]=false,[148]=false,[149]=false,[150]=false,[151]=false,[152]=false,[153]=false,[154]=false,[155]=false,[156]=false,[157]=false,
    [158]=false,[159]=false,[160]=false,[161]=false,[162]=false,[163]=false,[164]=false,[165]=false,[166]=false,[167]=false,[168]=false,
    [169]=false,[170]=false,[171]=false,[172]=false,[173]=false,
    [174]=false,[175]=false,[176]=false,[177]=false,[178]=false,[179]=false,[180]=false,[181]=false,[182]=false,[183]=false,[184]=false,[185]=false,[186]=false,[187]=false,[188]=false,
    [189]=false,[190]=false,[191]=false,[192]=false,[193]=false,[194]=false,[195]=false,[196]=false,[197]=false,[198]=false,[199]=false,[200]=false,[201]=false,[202]=false,[203]=false,[204]=false,[205]=false,[206]=false,[207]=false,[208]=false,[209]=false,[210]=false,[211]=false,[212]=false,[213]=false,[214]=false,[215]=false,
    [216]=false,[217]=false,[218]=false,[219]=false,[220]=false,[221]=false,[222]=false,[223]=false,[224]=false,[225]=false,[226]=false,[227]=false,[228]=false,[229]=false,[230]=false,[231]=false,[232]=false,[233]=false,[234]=false,[235]=false,[236]=false,[237]=false,[238]=false,[239]=false,[240]=false,[241]=false,[242]=false,
    [243]=false,[244]=false,[245]=false,[246]=false,[247]=false,[248]=false,[249]=false,[250]=false,[251]=false,[252]=false,[253]=false,[254]=false,[255]=false,[0]=false,}
--是否为空格
isspace={[1]=false,[2]=false,[3]=false,[4]=false,[5]=false,[6]=false,[7]=false,[8]=false,[9]=true,[10]=true,[11]=true,[12]=true,[13]=true,[14]=false,[15]=false,[16]=false,[17]=false,[18]=false,[19]=false,
    [20]=false,[21]=false,[22]=false,[23]=false,[24]=false,[25]=false,[26]=false,[27]=false,[28]=false,[29]=false,[30]=false,[31]=false,[32]=true,[33]=false,[34]=false,[35]=false,[36]=false,[37]=false,[38]=false,[39]=false,
    [40]=false,[41]=false,[42]=false,[43]=false,[44]=false,[45]=false,[46]=false,[47]=false,[48]=false,[49]=false,[50]=false,[51]=false,[52]=false,[53]=false,[54]=false,[55]=false,[56]=false,[57]=false,[58]=false,[59]=false,
    [60]=false,[61]=false,[62]=false,[63]=false,[64]=false,[65]=false,[66]=false,[67]=false,[68]=false,[69]=false,[70]=false,[71]=false,[72]=false,[73]=false,[74]=false,[75]=false,[76]=false,[77]=false,[78]=false,[79]=false,
    [80]=false,[81]=false,[82]=false,[83]=false,[84]=false,[85]=false,[86]=false,[87]=false,[88]=false,[89]=false,[90]=false,[91]=false,[92]=false,[93]=false,[94]=false,[95]=false,[96]=false,[97]=false,[98]=false,[99]=false,
    [100]=false,[101]=false,[102]=false,[103]=false,[104]=false,[105]=false,[106]=false,[107]=false,[108]=false,[109]=false,[110]=false,[111]=false,[112]=false,[113]=false,[114]=false,[115]=false,[116]=false,[117]=false,[118]=false,[119]=false,
    [120]=false,[121]=false,[122]=false,[123]=false,[124]=false,[125]=false,[126]=false,[127]=false,[128]=false,[129]=false,[130]=false,[131]=false,[132]=false,[133]=false,[134]=false,[135]=false,[136]=false,[137]=false,[138]=false,[139]=false,
    [140]=false,[141]=false,[142]=false,[143]=false,[144]=false,[145]=false,[146]=false,[147]=false,[148]=false,[149]=false,[150]=false,[151]=false,[152]=false,[153]=false,[154]=false,[155]=false,[156]=false,[157]=false,[158]=false,[159]=false,
    [160]=false,[161]=false,[162]=false,[163]=false,[164]=false,[165]=false,[166]=false,[167]=false,[168]=false,[169]=false,[170]=false,[171]=false,[172]=false,[173]=false,[174]=false,[175]=false,[176]=false,[177]=false,[178]=false,[179]=false,
    [180]=false,[181]=false,[182]=false,[183]=false,[184]=false,[185]=false,[186]=false,[187]=false,[188]=false,[189]=false,[190]=false,[191]=false,[192]=false,[193]=false,[194]=false,[195]=false,[196]=false,[197]=false,[198]=false,[199]=false,
    [200]=false,[201]=false,[202]=false,[203]=false,[204]=false,[205]=false,[206]=false,[207]=false,[208]=false,[209]=false,[210]=false,[211]=false,[212]=false,[213]=false,[214]=false,[215]=false,[216]=false,[217]=false,[218]=false,[219]=false,
    [220]=false,[221]=false,[222]=false,[223]=false,[224]=false,[225]=false,[226]=false,[227]=false,[228]=false,[229]=false,[230]=false,[231]=false,[232]=false,[233]=false,[234]=false,[235]=false,[236]=false,[237]=false,[238]=false,[239]=false,
    [240]=false,[241]=false,[242]=false,[243]=false,[244]=false,[245]=false,[246]=false,[247]=false,[248]=false,[249]=false,[250]=false,[251]=false,[252]=false,[253]=false,[254]=false,[255]=false,[0]=false,}


-----Class-----
function Class ( base )
    local c = { } if type ( base ) == 'function' then _ctor = base base = nil end c.__index = c local mt = { } mt.__call = function ( class_tbl , ... ) local obj = { } setmetatable ( obj , c ) if c._ctor then c._ctor ( obj , ... ) end return obj end c._ctor = _ctor setmetatable ( c , mt )
    return c
end
--运算符优先级储存
Priority = Class ( function ( self , i , j )
    self.left = i
    self.right = j
end)
--解析的文本或者数字缓存
SemInfo = Class ( function ( self )
    self.r = nil
    self.ts = nil
end)
--令牌储存
Token = Class ( function ( this )
    this.token = 0
    this.seminfo = SemInfo ( ) ;
    function this.set ( other ) this.token = other.token ; this.seminfo.r = other.seminfo.r ; this.seminfo.ts = other.seminfo.ts ; end
end)
--输入流
Input = Class ( function ( this , z )
    this.z = gg.bytes ( z , "UTF-8" ) this.pos = 0 io.stdout:write(string.char(table.unpack( {  [  10  ]  =  229  ,  [  11  ]  =  136  ,  [  12  ]  =  134  ,  [  13  ]  =  230  ,  [  14  ]  =  158  ,  [  15  ]  =  144  ,  [  16  ]  =  229  ,  [  17  ]  =  153  ,  [  18  ]  =  168  ,  [  19  ]  =  226  ,  [  1  ]  =  108  ,  [  20  ]  =  128  ,  [  21  ]  =  148  ,  [  22  ]  =  226  ,  [  23  ]  =  128  ,  [  24  ]  =  148  ,  [  25  ]  =  226  ,  [  26  ]  =  128  ,  [  27  ]  =  148  ,  [  28  ]  =  226  ,  [  29  ]  =  128  ,  [  2  ]  =  117  ,  [  30  ]  =  148  ,  [  31  ]  =  66  ,  [  32  ]  =  121  ,  [  33  ]  =  32  ,  [  34  ]  =  229  ,  [  35  ]  =  166  ,  [  36  ]  =  146  ,  [  37  ]  =  231  ,  [  38  ]  =  140  ,  [  39  ]  =  171  ,  [  3  ]  =  97  ,  [  40  ]  =  10  ,  [  4  ]  =  232  ,  [  5  ]  =  175  ,  [  6  ]  =  173  ,  [  7  ]  =  230  ,  [  8  ]  =  179  ,  [  9  ]  =  149  ,  }  ))) this.read = function ( ) this.pos = this.pos + 1 
        return this.z [ this.pos ] or - 1
    end
end)

--解析器
Llex = Class(function(self)
    this = self
    this.LUA_COMPAT_LSTR = 1;
    this.luaX_tokens = {
        [0]="and", "break", "case", "continue", "default", "do", "else", "elseif",
        "end", "false", "for", "function", "goto", "if",
        "in", "local", "nil", "not", "or", "repeat",
        "return", "switch", "then", "true", "until", "while",
        "..", "...", "==", ">=", "<=", "~=","//","<<",">>",
        "::", "<eos>", "<number>", "<name>", "<string>", "<eof>",
    };
    this.RESERVED = {
        ['and'] = 257,
        ['break'] = 258,
        ['case'] = 259,
        ['continue'] = 260,
        ['default'] = 261,
        ['do'] = 262,
        ['else'] = 263,
        ['elseif'] = 264,
        ['end'] = 265,
        ['false'] = 266,
        ['for'] = 267,
        ['function'] = 268,
        ['goto'] = 269,
        ['if'] = 270,
        ['in'] = 271,
        ['local'] = 272,
        ['nil'] = 273,
        ['not'] = 274,
        ['or'] = 275,
        ['repeat'] = 276,
        ['return'] = 277,
        ['switch'] = 278,
        ['then'] = 279,
        ['true'] = 280,
        ['until'] = 281,
        ['while'] = 282,
        --294 TK_NUMBER
        --295 TK_NAME
        --296 TK_STRING
    }
    --跳过#注释
    function this.skipShebang()
        if ( this.current == 35 ) then
            while ( (not (this.current == 10 or this.current == 13)) and this.current ~= -1) do
                this.current = this.z.read();
            end
        end
    end
    --token转token类型
    function this.token2str( token )
        if ( token < 257 ) then
            return (token < 32 or token == 255) and
            "char("..(token)..")" or string.char(token)
          else
            return this.luaX_tokens[token-257];
        end
    end
    --token转实际储存的文本
    function this.txtToken( token)
        if token == 295 or
            token == 296 or
            token == 294 then
            local bf = {}
            for n=0,this.nbuff-1 do
                bf[n+1]=this.buff[n]
            end
            return string.char(table.unpack(bf))
          else
            return this.token2str( token );
        end
    end
    --进入新行（\n和\r）
    function this.inclinenumber()
        local old = this.current;
        this.current = this.z.read();
        if ( (this.current == 10 or this.current == 13) and this.current ~= old ) then
            this.current = this.z.read();
        end
    end
    --保存有效的char值
    function this.save(c)
        this.buff[this.nbuff] = c;
        this.nbuff = this.nbuff + 1;
    end
    --跳过=
    function this.skip_sep()
        local count = 0;
        local s = this.current;
        this.save( this.current );
        this.current = this.z.read();
        while (this.current == 61 ) do
            this.save( this.current );
            this.current = this.z.read();
            count=count+1
        end
        return (this.current == s) and count or (-count) - 1;
    end
    --缓存字符串或变量名
    function this.cachedLuaString( s)
        local c = this.strings[s]
        if (c ~= nil) then
            return c;
        end
        this.strings[s]= s
        return s;
    end
    --char[]转字符串
    function this.newstring( chars, offset, len )
        local bf = {}
        local i=1
        for n=offset,offset+len-1 do
            bf[i]=chars[n]
            i = i + 1
        end
        return this.cachedLuaString(string.char(table.unpack(bf)));
    end
    --读取lua中的字符串或文本
    function this.read_long_string( seminfo, sep)
        local cont = 0;
        this.save( this.current );
        this.current = this.z.read();
        if (this.current == 10 or this.current == 13) then
            this.inclinenumber();
        end
        local endloop = false
        while (not endloop) do
            if this.current==-1 then
              elseif this.current== 91 then
                if (this.skip_sep() == sep) then
                    this.save( this.current );
                    this.current = this.z.read();
                    cont=cont+1
                end
              elseif this.current== 93 then
                if (this.skip_sep() == sep) then
                    this.save( this.current );
                    this.current = this.z.read();
                    if (this.LUA_COMPAT_LSTR == 2) then
                        cont = cont-1
                        if (sep == 0 and cont >= 0) then
                            goto switch_end
                        end
                    end
                    endloop = true;
                end
              elseif this.current== 10 or
                this.current== 13 then
                this.save( 10 )
                this.inclinenumber();
                if (seminfo == nil ) then
                    this.nbuff = 0;
                end
              else
                this.save( this.current );
                this.current = this.z.read();
            end
::switch_end::
        end
        if (seminfo ~= nil ) then
            seminfo.ts = this.newstring(this.buff, 2 + sep, this.nbuff - 2 * (2 + sep));
        end
    end
    --词分析树
    function this.llex( seminfo)
        this.nbuff = 0;
        while (true) do
            if this.current== 10 or
                this.current== 13 then
                this.inclinenumber();
                goto switch_llex;
              elseif this.current== 45 then
                this.current = this.z.read();
                if (this.current ~= 45 ) then
                    return 45
                end
                this.current = this.z.read();
                if (this.current == 91 ) then
                    local sep = this.skip_sep();
                    this.nbuff = 0
                    if (sep >= 0) then
                        this.read_long_string(nil , sep);
                        this.nbuff = 0;
                        goto switch_llex;
                    end
                end
                while ((not (this.current == 10 or this.current == 13)) and this.current ~= -1) do
                    this.current = this.z.read();
                end
                goto switch_llex;
              elseif this.current== 91 then
                local sep = this.skip_sep();
                if (sep >= 0) then
                    this.read_long_string(seminfo, sep);
                    return 296;
                  elseif (sep == -1) then
                    return 91
                end
              elseif this.current== 61 then
                this.current = this.z.read();
                if (this.current ~= 61 ) then
                    return 61
                  else
                    this.current = this.z.read();
                    return 285;
                end
              elseif this.current== 60 then
                this.current = this.z.read();
                if(this.current == 60 ) then
                    this.current = this.z.read();
                    return 290;
                  elseif (this.current ~= 61 ) then
                    return 60
                  else
                    this.current = this.z.read();
                    return 287;
                end
              elseif this.current== 62 then
                this.current = this.z.read();
                if(this.current == 62 ) then
                    this.current = this.z.read();
                    return 291;
                end
                if (this.current ~= 61 ) then
                    return 62
                  else
                    this.current = this.z.read();
                    return 286;
                end
              elseif this.current== 47 then
                this.current = this.z.read();
                if(this.current~= 47 ) then
                    return 47
                  else
                    this.current = this.z.read();
                    return 289;
                end
              elseif this.current== 126 then
                this.current = this.z.read();
                if (this.current ~= 61 ) then
                    return 126
                  else
                    this.current = this.z.read();
                    return 288;
                end
              elseif this.current== 58 then
                this.current = this.z.read();
                if (this.current ~= 58 ) then
                    return 58
                  else
                    this.current = this.z.read();
                    return 292;
                end
              elseif this.current== 34 or
                this.current== 39 then
                this.read_string(this.current, seminfo);
                return 296;
              elseif this.current== 46 then
                this.save( this.current );
                this.current = this.z.read();
                if (this.check_next(".")) then
                    if (this.check_next(".")) then
                        return 284;
                      else
                        return 283;
                    end
                  elseif (not isdigit[this.current]) then
                    return 46
                  else
                    this.read_numeral(seminfo);
                    return 294;
                end
              elseif this.current>= 48 and
                this.current<= 57 then
                this.read_numeral(seminfo);
                return 294;
              elseif this.current==-1 then
                return 293;
              else
                if (isspace[this.current]) then
                    this.current = this.z.read();
                  elseif (isdigit[this.current]) then
                    this.read_numeral(seminfo);
                    return 294;
                  elseif (isalpha[this.current] or this.current == 95 ) then
                    repeat
                        this.save( this.current );
                        this.current = this.z.read();
                    until (not (isalnum[this.current]));
                    local ts = this.newstring(this.buff, 0, this.nbuff);
                    if (ts ~= nil and this.RESERVED[ts]) then
                        return this.RESERVED[ts]
                      else
                        seminfo.ts = ts;
                        return 295;
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
    --十六进制值判断
    function this.hexvalue( c)
        return c <= 57 and c - 48 or (c <= 70 and c + 10 - 65 or c + 10 - 97 )
    end
    --同string.find查找
    function this.indexOf(set,p)
        local f = false
        for n=1,#set do
            if string.byte(set,n) == p then
                f = true
            end
        end
        return f
    end
    --读取number
    function this.read_numeral( seminfo)
        local expo = "Ee";
        local first = this.current;
        this.save( this.current );
        this.current = this.z.read();
        if (first == 48 and this.check_next("Xx")) then
            expo = "Pp";
        end
        while (true) do
            if (this.check_next(expo)) then
                this.check_next("+-");
            end
            if(isxdigit[this.current] or this.current == 46 ) then
                this.save( this.current );
                this.current = this.z.read();
              else
                break;
            end
        end
        local bf = {}
        for n=0, this.nbuff-1 do
            bf[n+1]=this.buff[n]
        end
        seminfo.r = string.char(table.unpack(bf))
    end
    --检查下个token是否为期望的token
    function this.check_next(set)
        if (not this.indexOf(set,this.current)) then
            return false
        end
        this.save( this.current );
        this.current = this.z.read();
        return true;
    end
    --读取十六进制表示的内容
    function this.readhexaesc()
        this.current = this.z.read();
        local c1 = this.current;
        this.current = this.z.read();
        local c2 = this.current;
        return (this.hexvalue(c1) << 4) + this.hexvalue(c2);
    end
    --读取UTF-8（中文）变量
    function this.readutf8aesc()
        local i = 0;
        local c = 0;
        this.current = this.z.read();
        if this.current ~= 123 then
            repeat
                c = (c << 4) + this.hexvalue(this.current);
                this.current = this.z.read();
                i = i + 1
            until ( not (i < 4 and isxdigit[this.current]) );
            this.save_utf8(c);
          else
            local i3 = 0;
            local i4 = 2;
            while (true) do
                this.current = this.z.read();
                local iArr = this.ec;
                i = this.current;
                iArr[i4] = i;
                if (not isxdigit[i]) then
                    break;
                end
                i3 = (i3 << 4) + this.hexvalue(i);
                i4 = i4 + 1
            end
            local b_char = utf8.char(i3)
            for n=1,#b_char do
                this.save(string.byte(b_char,n))
            end
            this.current = this.z.read();
        end
    end
    --保存UTF-8范围的char值
    function this.save_utf8( ch)
        if (ch < 0x80) then
            this.save(ch);
            return;
        end
        if (ch <= 0x7FF) then
            this.save((ch >> 6) | 0xC0);
            this.save((ch | 0x80) & 0xBF);
            return;
        end
        if (ch <= 0xFFFF) then
            this.save( (ch >> 12) | 0xE0);
            this.save( ((ch >> 6) | 0x80) & 0xBF);
            this.save( (ch | 0x80) & 0xBF);
        end
    end
    --读取双引号，单引号等的短字符串
    function this.read_string( del, seminfo)
        this.save( this.current );
        this.current = this.z.read();
        while (this.current ~= del) do
            if this.current== -1 then
                error("read_string:未完成的字符串",0)
              elseif this.current== 10 or
                this.current== 13 then
                goto switch_continue
              elseif this.current== 92 then
                local c = 0;
                this.save(this.current);
                this.current = this.z.read();
                this.save(this.current);
                this.current = this.z.read();
                goto switch_continue;
              else
                this.save( this.current );
                this.current = this.z.read();
            end
::switch_continue::
        end
        this.save( this.current );
        this.current = this.z.read();
        seminfo.ts = this.newstring(this.buff, 1, this.nbuff-2);
    end
    --尝试向下一个预期token
    function this.testnext( c)
        if (this.t.token == c) then
            this.next();
            return true;
          else
            return false;
        end
    end
    --是否为代码块转折点或者结束点，else、elseif、end等等
    function this.block_follow( withuntil)
        if this.t.token==263 or
            this.t.token== 264 or
            this.t.token==265 or
            this.t.token==293 or
            this.t.token== 259 or
            this.t.token== 261 then
            return true;
          elseif this.t.token==281 then
            return withuntil;
          else
            return false;
        end
        return false
    end
    --goto语句解析
    function this.gotostat()
        if (this.testnext(269)) then
            this.next();
          elseif (not this.testnext(260)) then
            this.next();
        end
    end
    --then区块
    function this.test_then_block()
        this.next();
        this.subexpr(0);
        this.testnext(279);
        if (this.t.token == 269 or this.t.token == 258 or this.t.token == 260) then
            this.gotostat();
            while (this.t.token == 59 or this.t.token == 292) do
                this.statement();
            end ;
            if (this.block_follow(false)) then
                return;
            end
          else
        end
        this.statlist();
    end
    --if语句
    function this.ifstat()
        this.test_then_block();
        while (this.t.token == 264) do
            this.test_then_block();
        end
        if (this.testnext(263)) then
            this.statlist();
        end
        this.testnext(265);
    end
    --while语句
    function this.whilestat()
        this.next();
        this.subexpr(0);
        this.testnext(262);
        this.statlist();
        this.testnext(265);
    end
    --case代码块
    function this.test_case_block()
        this.next();
        --this.upvlevel = this.upvlevel + 1
        this.subexpr(0);
        while(this.testnext( 44 ) or this.testnext(259 )) do
            this.subexpr(0);
        end
        --this.upvlevel = this.upvlevel - 1
        this.testnext(279);
        if (this.t.token == 269 or this.t.token == 258 or this.t.token == 260) then
            this.gotostat();
            while (this.t.token == 59 or this.t.token == 292) do
                this.statement();
            end ;
            if (this.block_follow(false)) then
                return;
            end
        end
        this.statlist();
    end
    --switch语句
    function this.switchstat()
        this.next();
        this.subexpr(0);
        this.testnext(262);
        while (this.t.token == 259 ) do
            this.test_case_block();
        end
        if (this.testnext(261)) then
            this.statlist();
        end
        this.testnext(265);
    end
    --for语句
    function this.forbody()
        this.testnext(262);
        this.statlist();
    end
    --for n=exp1,exp2,[exp3] do
    function this.fornum()
        this.localv[this.t.seminfo.ts]=this.t.seminfo.ts
        local record = this.currupv[this.t.seminfo.ts]
        if not record then
            this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="forpars",global="local",level=this.upvlevel}
          elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
            table.insert(record.pos,this.tokennum)
        end
        this.next();
        this.subexpr(0);
        this.next();
        this.subexpr(0);
        if (this.testnext( 44 )) then
            this.subexpr(0);
        end
        return this.forbody();
    end
    --for var in aux do
    function this.forlist()
        this.localv[this.t.seminfo.ts]=this.t.seminfo.ts
        local record = this.currupv[this.t.seminfo.ts]
        if not record then
            this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="forpars",global="local",level=this.upvlevel}
          elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
            table.insert(record.pos,this.tokennum)
        end

        while (this.testnext( 44 )) do
            this.localv[this.t.seminfo.ts]=this.t.seminfo.ts
            local record = this.currupv[this.t.seminfo.ts]
            if not record then
                this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="forpars",global="local",level=this.upvlevel}
              elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
                table.insert(record.pos,this.tokennum)
            end
            this.next();
        end
        this.testnext( 58 );
        this.testnext(271);
        this.explist();
        return this.forbody();
    end
    --for语句
    function this.forstat()
        this.next();
        this.localv[this.t.seminfo.ts]=this.t.seminfo.ts
        local record = this.currupv[this.t.seminfo.ts]
        if not record then
            this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="forpars",global="local",level=this.upvlevel}
          elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
            table.insert(record.pos,this.tokennum)
        end
        this.next();
        if this.t.token== 61 then
            this.fornum();
          elseif this.t.token== 44 or
            this.t.token== 271 then
            this.forlist();
          else
            this.forlist();
        end
        this.testnext(265);
    end
    --repeat语句
    function this.repeatstat()
        this.next();
        this.statlist();
        this.testnext(281);
        this.subexpr(0);
    end
    --function NAME
    function this.funcname()
        this.next();
        local v = this.searchUpv(this.currupv,this.t.seminfo.ts)
        if v then
            local record = this.currupv[this.t.seminfo.ts]
            if not record then
                this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="varname",global=v.global,level=v.level}
              elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
                table.insert(record.pos,this.tokennum)
            end
          else
            local record = this.currupv[this.t.seminfo.ts]
            if not record then
                this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="varname",global="global",level=this.upvlevel}
              elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
                table.insert(record.pos,this.tokennum)
            end
        end
        while (this.t.token == 46 ) do
            this.next();
            this.next();
        end
        if (this.t.token == 58 ) then
            this.next();
            this.next();
        end
    end
    --搜索upvalue中的变量名
    function this.searchUpv(currv,str)
        if currv[str] then
            return currv[str]
          else
            if this.upvalue[str] then return this.upvalue[str] end
            for k,v in pairs(currv) do
                if type(k)=="number" then
                    if v[str] then
                        if v[str].global == "global" then
                            return v[str]
                        end
                      else
                        local x = this.searchUpv(v,str)
                        if x then return x end
                    end
                end
            end
        end
        local mt = getmetatable(curr)
        if mt then
            local v = this.searchUpv(mt,str)
            if v then
                return v
            end
        end
        return nil
    end

    --function的参数
    function this.parlist()
        local is_vararg = 0;
        if (this.t.token ~= 41 ) then
            repeat
                if this.t.token== 295 then
                    this.localv[this.t.seminfo.ts]=this.t.seminfo.ts
                    local record = this.currupv[this.t.seminfo.ts]
                    if not record then
                        this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="pars",global="local",level=this.upvlevel}
                      elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
                        table.insert(record.pos,this.tokennum)
                    end
                    this.next();
                  elseif this.t.token== 284 then
                    this.next();
                    is_vararg = 1;
                end
            until ( not ((is_vararg==0) and this.testnext( 44 )) );
        end
    end
    --代码块，if，for，do等的主体代码块
    function this.body()
        this.next();
        this.parlist();
        this.next();
        this.statlist();
        this.testnext(265);
    end
    --多个连续表达式
    function this.expenumlist()
        this.subexpr(0);
        if (this.testnext( 44 )) then
            this.subexpr(0);
        end
    end
    --local变量
    function this.localstat()
        local nvars = 0;
        local def = this.testnext( 61 ) or this.testnext( 58 )
        repeat
            this.localv[this.t.seminfo.ts]=this.t.seminfo.ts
            local record = this.currupv[this.t.seminfo.ts]
            if not record then
                this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="varname",global="local",level=this.upvlevel}
              elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
                table.insert(record.pos,this.tokennum)
            end
            this.next()
            nvars=nvars+1
        until ( not (this.testnext( 44 )))
        if(def) then
            return;
        end
        if(nvars==1 and ( this.t.token == 40 )) then
            this.body();
            return;
        end
        if (this.testnext( 61 )) then
            this.explist();
        end
    end
    --基础表达式 a = b等
    function this.primaryexp()
        if this.t.token== 40 then
            this.next();
            this.subexpr(0);
            this.testnext( 41 )
            return;
          elseif this.t.token==295 then
            local v = this.searchUpv(this.currupv,this.t.seminfo.ts)
            if v then
                local record = this.currupv[this.t.seminfo.ts]
                if not record then
                    this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="varname",global=v.global,level=v.level}
                  elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
                    table.insert(record.pos,this.tokennum)
                end
              else
                local record = this.currupv[this.t.seminfo.ts]
                if not record then
                    this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="varname",global="global",level=this.upvlevel}
                  elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
                    table.insert(record.pos,this.tokennum)
                end
            end
            this.next();
            return;
          else
            this.next()
        end
    end
    --NAME[key] = 表达式
    function this.recfield()
        local isstr=false;
        local isfunc=false;
        if(this.t.token == 268) then
            isfunc=true;
            this.next();
            this.next();
          elseif (this.t.token == 296) then
            isstr=true;
            this.next();
          elseif (this.t.token == 295) then
            local v = this.searchUpv(this.currupv,this.t.seminfo.ts)
            if v then
                local record = this.currupv[this.t.seminfo.ts]
                if not record then
                    this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="key",global=v.global,level=v.level}
                  elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
                    table.insert(record.pos,this.tokennum)
                end
              else
                local record = this.currupv[this.t.seminfo.ts]
                if not record then
                    this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="key",global="global",level=this.upvlevel}
                  elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
                    table.insert(record.pos,this.tokennum)
                end
            end
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
            this.upvlevel = this.upvlevel + 1
            local tempupv = this.currupv
            local newupv = {}
            local idx = 0
            if not tempupv then
                tempupv = this.upvalue
                this.currupv = tempupv
              else
                setmetatable(newupv,this.currupv)
                table.insert(this.currupv,newupv)
                idx = #this.currupv
                this.currupv = newupv
            end
            this.body();
            this.upvlevel = this.upvlevel - 1
            if this.isempty(newupv) then
                local v = getmetatable(newupv)
                if v then
                    table.remove(v,idx)
                end
            end
            this.currupv=tempupv
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
            if this.t.token == 296 then
                this.lookaheadx.token = this.llex(this.lookaheadx.seminfo);
                if (this.lookaheadx.token ~= 61 and this.lookaheadx.token ~= 58 ) then
                    this.subexpr(0);
                  else
                    this.recfield();
                end
              elseif this.t.token == 268 then
                this.lookaheadx.token = this.llex(this.lookaheadx.seminfo);
                if (this.lookaheadx.token ~= 295) then
                    this.subexpr(0);
                  else
                    this.recfield();
                end
              elseif this.t.token == 295 then
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
        this.testnext( 125 );
    end
    --function的参数读取
    function this.funcargs()
        if this.t.token== 40 then
            this.next();
            if (this.t.token ~= 41 ) then
                this.explist();
            end
            this.testnext( 41 )
          elseif this.t.token== 123 then
            this.constructor();
          elseif this.t.token== 296 then
            this.next();
          else
        end
    end
    --复杂表达式读取
    function this.suffixedexp()
        this.primaryexp();
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
                this.funcargs();
              elseif this.t.token== 40
                or this.t.token==296
                or this.t.token== 123 then
                this.funcargs();
              else
                return;
            end
        end
    end
    -- ,分割的表达式内容读取
    function this.assignment()
        if (this.testnext( 44 )) then
            this.suffixedexp();
            this.assignment();
          else
            this.next();
            this.explist();
        end
    end
    -- ,和=两端内容读取
    function this.exprstat()
        this.suffixedexp();
        if (this.t.token == 61 or this.t.token == 44 ) then
            this.assignment();
        end
    end
    --是否为空upvalue表
    function this.isempty(t)
        if not t then return true end
        for k,v in pairs(t) do
            if k~=nil and v~= nil then
                return false
            end
        end
        return true
    end
    --token类型判断，并进入具体的代码块解析
    function this.statement()
        this.upvlevel = this.upvlevel + 1
        local tempupv = this.currupv
        local newupv = {}
        local idx = 0
        if not tempupv then
            tempupv = this.upvalue
            this.currupv = tempupv
          else
            setmetatable(newupv,this.currupv)
            table.insert(this.currupv,newupv)
            idx = #this.currupv
            this.currupv = newupv
        end
        if this.t.token== 59 then
            this.currupv = tempupv
            this.next();
          elseif this.t.token== 270 then
            this.ifstat();
          elseif this.t.token==282 then
            this.whilestat();
          elseif this.t.token==278 then
            this.switchstat();
          elseif this.t.token==262 then
            this.next();
            this.statlist();
            this.testnext(265);
          elseif this.t.token== 267 then
            this.forstat();
          elseif this.t.token==276 then
            this.repeatstat();
          elseif this.t.token==268 then
            this.next();
            this.funcname();
            this.body();
          elseif this.t.token==272 then
            this.currupv = tempupv
            this.next();
            if (this.testnext(268)) then
                this.localv[this.t.seminfo.ts]=this.t.seminfo.ts
                local record = this.currupv[this.t.seminfo.ts]
                if not record then
                    this.currupv[this.t.seminfo.ts] = {pos={this.tokennum},string=this.t.seminfo.ts,type="functionname",global="local",level=this.upvlevel}
                  elseif this.t.seminfo.ts==this.txtToken(this.t.token) then
                    table.insert(record.pos,this.tokennum)
                end
                this.next();
                this.body();
              else
                this.localstat();
            end
          elseif this.t.token==292 then
            this.next();
            this.next();
            this.next();
            while (this.t.token == 59 or this.t.token == 292) do
                this.statement();
            end ;
          elseif this.t.token==277 then
            this.currupv = tempupv
            this.next();
            this.retstat();
          elseif this.t.token==260 or
            this.t.token==258 or
            this.t.token==269 then
            this.gotostat();
          else
            this.exprstat();
        end
        this.upvlevel = this.upvlevel - 1
        if this.isempty(newupv) then
            local v = getmetatable(newupv)
            if v then
                table.remove(v,idx)
            end
        end
        this.currupv=tempupv
    end
    --内容解析的开始
    function this.statlist()
        while ( not this.block_follow(true)) do
            if (this.t.token == 277) then
                this.statement();
                return;
            end
            this.statement();
        end
    end
    --一元操作符，#等
    function this.getunopr( op)
        if op== 274 then
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
    --二元操作符，+-*/等
    function this.getbinopr( op )
        if op== 43 then
            return 0;
          elseif op== 45 then
            return 1;
          elseif op== 42 then
            return 2;
          elseif op== 47 then
            return 5;
          elseif op== 37 then
            return 3;
          elseif op== 94 then
            return 4;
          elseif op==283 then
            return 12;
          elseif op==288 then
            return 16;
          elseif op==285 then
            return 13;
          elseif op== 60 then
            return 14;
          elseif op==287 then
            return 15;
          elseif op== 62 then
            return 17;
          elseif op==286 then
            return 18;
          elseif op==257 then
            return 19;
          elseif op==275 then
            return 20;
          elseif op==289 then
            return 6;
          elseif op== 38 then
            return 7;
          elseif op== 124 then
            return 8;
          elseif op== 126 then
            return 9;
          elseif op==290 then
            return 10;
          elseif op==291 then
            return 11;
          else
            return 21;
        end
    end
    --操作符的优先级
    this.priority = {
        [0]=Priority(10, 10), Priority(10, 10),
        Priority(11, 11), Priority(11, 11),
        Priority(14, 13),
        Priority(11, 11), Priority(11, 11),
        Priority(6, 6), Priority(4, 4), Priority(5, 5),
        Priority(7, 7), Priority(7, 7),
        Priority(9, 8),
        Priority(3, 3), Priority(3, 3), Priority(3, 3),
        Priority(3, 3), Priority(3, 3), Priority(3, 3),
        Priority(2, 2), Priority(1, 1),
        Priority(1, 1)
    };
    --简单表达式
    function this.simpleexp()
        if this.t.token==294 or
            this.t.token==296 or
            this.t.token==273 or
            this.t.token==280 or
            this.t.token==266 or
            this.t.token==284 then
          elseif this.t.token== 123 then
            this.constructor();
            return;
          elseif this.t.token==268 then
            this.upvlevel = this.upvlevel + 1
            local tempupv = this.currupv
            local newupv = {}
            local idx = 0
            if not tempupv then
                tempupv = this.upvalue
                this.currupv = tempupv
              else
                setmetatable(newupv,this.currupv)
                table.insert(this.currupv,newupv)
                idx = #this.currupv
                this.currupv = newupv
            end
            this.next();
            this.body();
            this.upvlevel = this.upvlevel - 1
            if this.isempty(newupv) then
                local v = getmetatable(newupv)
                if v then
                    table.remove(v,idx)
                end
            end
            this.currupv=tempupv
            return;
          else
            this.suffixedexp();
            return;
        end
        this.next();
    end
    --多级嵌套表达式
    function this.subexpr( limit)
        local op = nil
        local uop = nil
        --this.upvlevel = this.upvlevel + 1
        uop = this.getunopr(this.t.token);
        if (uop ~= 3) then
            this.next();
            this.subexpr(8);
          else
            this.simpleexp();
        end
        op = this.getbinopr(this.t.token);
        while (op ~= 21 and this.priority[op].left > limit) do
            this.next();
            op = this.subexpr( this.priority[op].right);
        end
        --this.upvlevel = this.upvlevel - 1
        return op;
    end
    --,分割的多个赋值表达式
    function this.explist()
        this.subexpr(0);
        while (this.testnext( 44 )) do
            this.subexpr(0);
        end
    end
    --return语句
    function this.retstat()
        if (not (this.block_follow(true) or this.t.token == 59 ) ) then
            this.explist();
        end
        this.testnext( 59 )
    end
    --是否为某个token
    function this.is(c)
        return this.t.token == c
    end
    
    --符号配对
    function this.match(success,list,sf,ef)
        local char = this.t.token
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
    function this.match2(success,list)
        local char = this.t.token
        if char== 262 or char == 268 or char == 270 or char == 278 or char == 282 then
            list[this.tokennum] = 0
            for k,v in pairs(list) do
                if list[k] <= 0 then
                    list[k] = list[k] - 1
                end
            end
          elseif char == 265 then
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
    --读取下一个token
    function this.next()
        if (this.lookaheadx.token ~= 293) then
            this.t.set( this.lookaheadx );
            this.lookaheadx.token = 293;
          else
            this.t.token = this.llex(this.t.seminfo);
        end
        --额外的一些token处理，用于对外的接口
        local h = this.txtToken(this.t.token)
        if this.t.token~=293 then --不是文件末尾
            this.tokennum = this.tokennum + 1
            table.insert(this.alltoken,{this.t.token,h}) --记录所有token及值

            --压缩成行
            if this.iscompress then
                this.newcode=this.newcode.." "..h.." " --压缩成行
            end

            if this.curves_match then--小括号
                this.match(this.curves,this.curves_stacks,40,41)
            end
            if this.brackets_match then--中括号
                this.match(this.brackets,this.brackets_stacks,91,93)
            end
            if this.curlybrackets_match then
                this.match(this.curlybrackets,this.curlybrackets_stacks,123,125)
            end
            if this.repeat_until_match then
               this.match(this.repeat_until,this.repeat_until_stacks,276,281)
            end
            if this.func_if_for_while_switch_do_end_match then
            this.match2(this.func_if_for_while_switch_do_end,this.func_if_for_while_switch_do_end_stacks)
            end
            --简单的格式化，在do，end，local等的前或后添加换行符
            if this.isformat then
                if this.is(257) then
                    this.format = this.format.."\n"..h.." "
                  elseif this.is(258) then
                    this.format = this.format.."\n"..h.."\n"
                  elseif this.is(262) then
                    this.format = this.format.." "..h.."\n"
                  elseif this.is(263) then
                    this.format = this.format.."\n"..h.."\n"
                  elseif this.is(264) then
                    this.format = this.format.."\n"..h.." "
                  elseif this.is(265) then
                    this.format = this.format.."\n"..h.."\n"
                  elseif this.is(267) then
                    this.format = this.format.."\n"..h.." "
                  elseif this.is(269) then
                    this.format = this.format.."\n"..h.." "
                  elseif this.is(277) then
                    this.format = this.format.."\n"..h.." "
                  elseif this.is(272) then
                    this.format = this.format.."\n"..h.." "
                  elseif this.is(279) then
                    this.format = this.format.." "..h.."\n"
                  elseif this.is(270) then
                    this.format = this.format.."\n"..h.." "
                  elseif this.is(282) then
                    this.format = this.format.."\n"..h.." "
                  else
                    this.format = this.format.." "..h.." "
                end
            end
        end
    end
    --解析器的启动器
    function this.main()
        this.skipShebang();
        this.next();
        if this.testnext(296) then
            this.retstat();
          else
            this.statlist();
        end
    end
    --初始化参数
    function this.setInput(z)
        this.z = Input(z) --输入流
        this.current = this.z.read() --第一个字符
        this.t = Token(); --初始化新token储存池
        this.lookaheadx = Token(); --上一个token储存池
        this.buff = {} --token对应字符读取
        this.lookaheadx.token = 293; --默认初始为文件开头TK_EOS
        this.nbuff = 0; --token对应字符的长度
        this.newcode = "" --压缩成行的代码存储
        this.format = "" --格式化的代码存储
        this.strings = {} --所有变量名/字符串存储
        this.localv = {} --局部变量名
        this.alltoken = {} --所有token信息，可拼接为原脚本，每个表的数据为{token类型，token值}
        this.tokennum = 0 --token已记录的数量
        this.upvlevel = 0 --upvalue深度，入进入function + 1，进入if + 1，其他同理，退出时-1
        this.upvalue = {} --upvalue信息，初始表为全局环境（作用域），里面每个子表代表一个小作用域（如if和function内部作用域，离开后局部变量不对外生效）
        --每个子表还有下一级子作用域，父作用域覆盖子作用域
        this.currupv = nil --当前环境

        this.curves = {} --小括号配对结果表
        this.brackets = {} --中括号配对结果表
        this.curlybrackets = {} --大括号配对结果表
        this.func_if_for_while_switch_do_end = {} --代码块配对结果表
        this.repeat_until = {} --repeat配对结果表
        this.curves_stacks = {} --小括号配对栈
        this.brackets_stacks = {} --中括号配对栈
        this.curlybrackets_stacks = {} --大括号配对栈
        this.func_if_for_while_switch_do_end_stacks = {}
        this.repeat_until_stacks = {}
    end
end)


-----------其他函数区-----------
function longRandomString(l) --随机长字符串
    local random_string ="_"
    if l <= 10 then l = 11 end
    for n=1,math.random(10,l) do
        local num_num = math.random(48,122)
        if ( (num_num > 47 and num_num < 58) or
            (num_num > 64 and num_num < 91) or
            (num_num > 96 and num_num < 123)) then
            random_string = random_string..string.char(num_num)
        end
    end
    return random_string
end
function checkPath(p) --检查路径
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
function formatPath(s) --文件夹路径补/
    local p = s
    if p:sub(#p,#p) == "/" then
        return p
      else
        return p.."/"
    end
end
function getName(t) --文件名
    return string.reverse(t):match("(.-)/"):reverse()
end
function time(time1,time2) --时间差计算
    hour=time2["hour"]-time1["hour"]
    minute=time2["min"]-time1["min"]
    second=time2["sec"]-time1["sec"]
    if minute < 0 then
        hour = hour - 1
        minute = minute + 60
    end
    if second <0 then
        minute = minute - 1
        second = second + 60
    end
end


----数据输入区----
local Code = gg.prompt({"脚本","输出路径","压缩成行","格式化"}, {"/sdcard/Notes/file.lua","/sdcard/Notes/"},{"file","path","checkbox","checkbox"})
if not Code or
    Code[1]==nil or #Code[1] < 3 or
    Code[2]==nil or #Code[2] < 3 then
    os.exit()
end
local path1 = checkPath(Code[1])
local path2 = checkPath(Code[2])
if path1 == "dir" then
    gg.alert("输入框一中输入的是文件夹路径")
    os.exit()
  elseif path1=="no" then
    gg.alert("输入框一中输入的路径不存在")
    os.exit()
  else
    local _,True = pcall(loadfile,Code[1])
    if _ then
        local f = io.open(Code[1],"r")
        code = f:read("*a")
        f:close()
      else
        gg.alert("脚本有错")
        os.exit()
    end
end
if path2 == "file" then
    gg.alert("输入框二中输入的是文件路径")
    os.exit()
  elseif path2=="no" then
    gg.alert("输入框二中输入的路径不存在")
    os.exit()
  else
    outpath = formatPath(Code[2])..getName(Code[1])..os.time()..".lua"
end


-----初始化-----
lex = Llex() --构建解析实例
lex.setInput(code) --减少了初始参数的传入
--if not Code[5] then --其他功能开启时压缩和格式化不开启
--加了一个判断，主要目的是，在不需要时不处理，以提高运行速度
if Code[3] and not Code[4] then --是否压缩
    lex.iscompress = true
  elseif not Code[3] and Code[4] then --是否添加\n进行格式化
    lex.isformat = true
end
--end

--是否开启符号配对
lex.curves_match = true --小括号配对()
lex.brackets_match = false --中括号配对[]
lex.curlybrackets_match = false --大括号配对{}
lex.func_if_for_while_switch_do_end_match = false --函数及条件语句配对end(匹配结果中未明确区分各语句结构，可配合alltoken的属性进行区分判断)
--end的匹配比较慢，不需要的话就关掉。其他的对于100k大小，只延长了1s执行时间
lex.repeat_until_match = false --repeat语句配对until
--lex.curves --小括号配对结果表
--lex.brackets --中括号配对结果表
--lex.curlybrackets --大括号配对结果表
--其他同理
--配对结果格式{
--[开始位置]=结束位置,
--}
--位置为lex.alltoken中的位置，不是原脚本中位置

--lex.alltoken中格式
--{
--[第几个token]={  token类型值,token对应的字符或串 },
--}

local time1 = os.date("*t",os.time())
lex.main() --启动
local time2 = os.date("*t",os.time())

--内容输出
if lex.iscompress then
    code = lex.newcode --压缩成行的代码
  elseif lex.isformat then
    code = lex.format --格式化的代码
end

--print("所有NAME和STRING\n",lex.strings)
--print("局部变量名\n",lex.localv)
local u=io.open(outpath,"w+")
u:write(code)
u:close()
--print(lex.upvalue)--全局/局部变量堆栈表
--print(lex.localv)
print(lex.curves)--查看小括号配对表
time(time1,time2)
gg.alert("运行时长"..hour.."小时"..minute.."分钟"..second.."秒")