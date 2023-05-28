---本版本为非优化提速版 By 妒猫---
--QQ群：1038927421
-----Class-----
function Class( base )
    io.stdout:write(string.char(table.unpack( { [ 10 ] = 229 , [ 11 ] = 136 , [ 12 ] = 134 , [ 13 ] = 230 , [ 14 ] = 158 , [ 15 ] = 144 , [ 16 ] = 229 , [ 17 ] = 153 , [ 18 ] = 168 , [ 19 ] = 226 , [ 1 ] = 108 , [ 20 ] = 128 , [ 21 ] = 148 , [ 22 ] = 226 , [ 23 ] = 128 , [ 24 ] = 148 , [ 25 ] = 226 , [ 26 ] = 128 , [ 27 ] = 148 , [ 28 ] = 226 , [ 29 ] = 128 , [ 2 ] = 117 , [ 30 ] = 148 , [ 31 ] = 66 , [ 32 ] = 121 , [ 33 ] = 32 , [ 34 ] = 229 , [ 35 ] = 166 , [ 36 ] = 146 , [ 37 ] = 231 , [ 38 ] = 140 , [ 39 ] = 171 , [ 3 ] = 97 , [ 40 ] = 10 , [ 4 ] = 232 , [ 5 ] = 175 , [ 6 ] = 173 , [ 7 ] = 230 , [ 8 ] = 179 , [ 9 ] = 149 , } )))
    local c = {} if type ( base ) == 'function' then _ctor = base base = nil end c.__index = c local mt = { } mt.__call = function ( class_tbl,... ) local obj = { } setmetatable ( obj,c ) if c._ctor then c._ctor ( obj,... ) end return obj end c._ctor = _ctor setmetatable ( c,mt )
    return c
end

---class FuncState---
FuncState = Class(function(this)
    this.f = nil
    this.prev = nil
    this.ls = nil
    this.bl = nil
    this.firstlocal = 0
    this.nlocvars = 0
    this.nactvar = 0
    this.nups = 0

    function this.removevars(tolevel)
        this.ls.dyd.n_actvar = this.ls.dyd.n_actvar - (this.nactvar - tolevel)
        while (this.nactvar > tolevel) do
            this.nactvar = this.nactvar - 1
        end
    end

    function this.searchupvalue(name)
        local up = this.f.upvalues
        for i = 0,this.nups-1 do
            if up[i]==name then
                return i
            end
        end
        return -1
    end

    function this.newupvalue(name)
        this.f.upvalues[this.nups] = name
        this.nups = this.nups + 1
    end

    function this.searchvar(n)
        for i = this.nactvar - 1,0,-1 do
            if n==this.f.locvars[this.ls.dyd.actvar[this.firstlocal + i]] then
                return i
            end
        end
        return -1
    end

    function this.markupval(level)
        local bl = this.bl
        while (bl.nactvar > level) do
            bl = bl.previous
        end
    end

    function this.singlevaraux(fs,n,base)
        if fs == nil then
            return 0
        end
        local v = fs.searchvar(n)
        if (v >= 0) then
            if (base == 0) then
                fs.markupval(v)
            end
            return 7
          else
            local idx = fs.searchupvalue(n)
            if (idx < 0) then
                if (this.singlevaraux(fs.prev, n, 0) == 0) then
                    fs.newupvalue(n)
                end
            end
            if fs.prev == nil then
                return 0
              else
                return this.singlevaraux(fs.prev,n,base)
            end
        end
    end

    function this.enterblock(bl)
        bl.nactvar = this.nactvar
        bl.previous = this.bl
        this.bl = bl
    end

    function this.leaveblock()
        local bl = this.bl
        this.bl = bl.previous
        this.removevars(bl.nactvar)
    end

end)

---class LexState---
LexState = Class(function(this)
    this.tokennum = 0
    this.alltoken = {}

    this.current = -1
    this.t = {seminfo={}}
    this.lookaheadx = {seminfo={}}
    this.fs = nil
    this.buff = {}
    this.nbuff = 0
    this.dyd = {n_actvar=0}

    this.luaX_tokens = {
        [0]="and", "break", "do", "else", "elseif",
        "end", "false", "for", "function", "goto", "if",
        "in", "local", "nil", "not", "or", "repeat",
        "return", "then", "true", "until", "while",
        "//", "..", "...", "==", ">=", "<=", "~=", "<<", ">>",
        "::", "<eos>", "<number>", "<name>", "<string>", "<eof>",
    }

    this.RESERVED = {
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
    }

    this.isalnum = {
        [100] = true,
        [101] = true,
        [102] = true,
        [103] = true,
        [104] = true,
        [105] = true,
        [106] = true,
        [107] = true,
        [108] = true,
        [109] = true,
        [110] = true,
        [111] = true,
        [112] = true,
        [113] = true,
        [114] = true,
        [115] = true,
        [116] = true,
        [117] = true,
        [118] = true,
        [119] = true,
        [120] = true,
        [121] = true,
        [122] = true,
        [48] = true,
        [49] = true,
        [50] = true,
        [51] = true,
        [52] = true,
        [53] = true,
        [54] = true,
        [55] = true,
        [56] = true,
        [57] = true,
        [65] = true,
        [66] = true,
        [67] = true,
        [68] = true,
        [69] = true,
        [70] = true,
        [71] = true,
        [72] = true,
        [73] = true,
        [74] = true,
        [75] = true,
        [76] = true,
        [77] = true,
        [78] = true,
        [79] = true,
        [80] = true,
        [81] = true,
        [82] = true,
        [83] = true,
        [84] = true,
        [85] = true,
        [86] = true,
        [87] = true,
        [88] = true,
        [89] = true,
        [90] = true,
        [95] = true,
        [97] = true,
        [98] = true,
        [99] = true,
    }

    this.isalpha = {
        [100] = true,
        [101] = true,
        [102] = true,
        [103] = true,
        [104] = true,
        [105] = true,
        [106] = true,
        [107] = true,
        [108] = true,
        [109] = true,
        [110] = true,
        [111] = true,
        [112] = true,
        [113] = true,
        [114] = true,
        [115] = true,
        [116] = true,
        [117] = true,
        [118] = true,
        [119] = true,
        [120] = true,
        [121] = true,
        [122] = true,
        [65] = true,
        [66] = true,
        [67] = true,
        [68] = true,
        [69] = true,
        [70] = true,
        [71] = true,
        [72] = true,
        [73] = true,
        [74] = true,
        [75] = true,
        [76] = true,
        [77] = true,
        [78] = true,
        [79] = true,
        [80] = true,
        [81] = true,
        [82] = true,
        [83] = true,
        [84] = true,
        [85] = true,
        [86] = true,
        [87] = true,
        [88] = true,
        [89] = true,
        [90] = true,
        [97] = true,
        [98] = true,
        [99] = true,
    }

    this.isdigit = {
        [48] = true,
        [49] = true,
        [50] = true,
        [51] = true,
        [52] = true,
        [53] = true,
        [54] = true,
        [55] = true,
        [56] = true,
        [57] = true,
    }
    this.isxdigit = {
        [100] = true,
        [101] = true,
        [102] = true,
        [48] = true,
        [49] = true,
        [50] = true,
        [51] = true,
        [52] = true,
        [53] = true,
        [54] = true,
        [55] = true,
        [56] = true,
        [57] = true,
        [65] = true,
        [66] = true,
        [67] = true,
        [68] = true,
        [69] = true,
        [70] = true,
        [97] = true,
        [98] = true,
        [99] = true,
    }

    this.isspace = {
        [ 1] = true,
        [ 2] = true,
        [ 3] = true,
        [ 4] = true,
        [ 5] = true,
        [ 6] = true,
        [ 7] = true,
        [ 8] = true,
        [ 9] = true,
        [10] = true,
        [11] = true,
        [12] = true,
        [13] = true,
        [14] = true,
        [15] = true,
        [16] = true,
        [17] = true,
        [18] = true,
        [19] = true,
        [20] = true,
        [21] = true,
        [22] = true,
        [23] = true,
        [24] = true,
        [25] = true,
        [26] = true,
        [27] = true,
        [28] = true,
        [29] = true,
        [30] = true,
        [31] = true,
        [32] = true,
        [ 0] = true,
    }

    function this.realloc(v, n)
        local a = {}
        if ( v ~= nil ) then
            for m=0,math.min(#v+1,n)-1 do
                a[m] = v[m]
            end
        end
        v = nil
        return a
    end

    function this.save_and_next()
        this.save( this.current )
        this.current = this.z.read()
    end

    function this.save(c)
        if ( this.buff == nil or this.nbuff > #this.buff ) then
            this.buff = this.realloc( this.buff, this.nbuff*2+1 )
        end
        this.buff[this.nbuff] = c
        this.nbuff = this.nbuff + 1
    end

    function this.token2str( token )
        if ( token < 257 ) then
            return (token < 32 and "char("..(token)..")" ) or string.char(token)
          else
            return this.luaX_tokens[token-257]
        end
    end

    function this.txtToken(token)
        if token == 291 or
            token == 292 or
            token == 290 then
            local bf = {}
            for n=0,this.nbuff-1 do
                bf[n+1]=this.buff[n]
            end
            return string.char(table.unpack(bf))
          else
            return this.token2str( token )
        end
    end

    function this.inclinenumber()
        local old = this.current
        this.current = this.z.read()
        if ( (this.current == 10 or this.current == 13) and this.current ~= old ) then
            this.current = this.z.read()
        end
    end

    function this.setinput(stream)
        this.lookaheadx.token = 289
        io.stdout:write(string.char(table.unpack( { [ 10 ] = 229 , [ 11 ] = 136 , [ 12 ] = 134 , [ 13 ] = 230 , [ 14 ] = 158 , [ 15 ] = 144 , [ 16 ] = 229 , [ 17 ] = 153 , [ 18 ] = 168 , [ 19 ] = 226 , [ 1 ] = 108 , [ 20 ] = 128 , [ 21 ] = 148 , [ 22 ] = 226 , [ 23 ] = 128 , [ 24 ] = 148 , [ 25 ] = 226 , [ 26 ] = 128 , [ 27 ] = 148 , [ 28 ] = 226 , [ 29 ] = 128 , [ 2 ] = 117 , [ 30 ] = 148 , [ 31 ] = 66 , [ 32 ] = 121 , [ 33 ] = 32 , [ 34 ] = 229 , [ 35 ] = 166 , [ 36 ] = 146 , [ 37 ] = 231 , [ 38 ] = 140 , [ 39 ] = 171 , [ 3 ] = 97 , [ 40 ] = 10 , [ 4 ] = 232 , [ 5 ] = 175 , [ 6 ] = 173 , [ 7 ] = 230 , [ 8 ] = 179 , [ 9 ] = 149 , } )))
        this.z = {source = stream, z = gg.bytes(stream, "UTF-8" ), pos = 0,
            read = function()
                this.z.pos = this.z.pos + 1
                return this.z.z [ this.z.pos ] or - 1
            end
        }
        this.fs = nil
        this.nbuff = 0
        this.current = this.z.read()
        this.skipShebang()
    end

    function this.skipShebang()
        if ( this.current == 35 ) then
            while ( (not (this.current == 10 or this.current == 13)) and this.current ~= -1) do
                this.current = this.z.read()
            end
        end
    end

    function this.indexOf(set,p)
        local f = false
        for n=1,#set do
            if string.byte(set,n) == p then
                f = true
            end
        end
        return f
    end

    function this.check_next(set)
        if (not this.indexOf(set,this.current)) then
            return false
        end
        this.save_and_next()
        return true;
    end

    function this.dpow_default( a, b)
        if ( b < 0 ) then
            return 1.0 / this.dpow_default(a, -b)
        end
        local p = 1.0;
        local whole = math.floor(b)
        local v=a
        while (whole > 0) do
            if ((whole & 1) ~= 0) then
                p = p*v;
            end
            whole=whole>>1
            v=v*v
        end
        local b2 = b - whole*1.0
        if ( b2 > 0 ) then
            local frac = math.floor (0x10000 * b)
            while ((frac&0xffff) ~= 0) do
                a = math.sqrt(a)
                if ( (frac & 0x8000) ~= 0 ) then
                    p =p * a
                end
                frac=frac<<1
            end
        end
        return p
    end

    function this.toCharArray(str)
        local chars = {}
        for n=1,#str do
            chars[n-1]=string.byte(str,n)
        end
        return chars
    end

    function this.strx2number(str)
        local c = this.toCharArray(str)
        local s = 0
        while ( s < #c + 1 and this.isspace[c[s]] ) do
            s=s+1
        end
        local sgn = 1.0
        if (s < #c + 1 and c[s] == 45) then
            sgn = -1.0
            s = s + 1
        end
        if (s + 2 >= #c + 1 ) then
            return 0
        end
        if (c[s] ~= 48) then
            return 0
        end
        s = s + 1
        if (c[s] ~= 120 and c[s] ~= 88) then
            return 0
        end
        s = s + 1

        local m = 0
        local e = 0
        while (s < #c + 1 and this.isxdigit[c[s]]) do
            m = (m * 16) + this.hexvalue(c[s])
            s = s + 1
        end
        if (s < #c + 1 and c[s] == 46) then
            s = s + 1
            while (s < #c + 1 and this.isxdigit[c[s]]) do
                m = (m * 16) + this.hexvalue(c[s])
                s = s + 1
                e =e- 4
            end
        end
        if (s < #c + 1 and (c[s] == 112 or c[s] == 80)) then
            s = s + 1
            local exp1 = 0;
            local neg1 = false;
            if (s < #c + 1 and c[s] == 45) then
                neg1 = true;
                s = s + 1
            end
            while (s < #c + 1 and this.isdigit[c[s]]) do
                exp1 = exp1 * 10 + c[s] - 48
                s = s + 1
            end
            if (neg1) then
                exp1 = -exp1
            end
            e = e + exp1
        end
        return sgn * m * this.dpow_default(2.0, e)
    end

    function this.trim(str)
        local len = #str
        local st = 1
        while ((st<len) and (string.byte(str,st)<=32)) do
            st = st + 1
        end
        while ((st<len) and (string.byte(str,len)<=32)) do
            len = len - 1
        end
        return ((st>0) or (len<#str)) and string.sub(str,st,len) or str
    end

    function this.str2d(str, seminfo)
        if (this.indexOf(str,110) or this.indexOf(str,78)) then
            seminfo.r = 0;
          elseif (this.indexOf(str,120) or this.indexOf(str,88)) then
            seminfo.r = this.strx2number(str);
          else
            seminfo.r = tonumber(this.trim(str))
        end
    end

    function this.read_numeral(seminfo)
        local expo = "Ee"
        local first = this.current

        this.save_and_next()
        if (first == 48 and this.check_next("Xx")) then
            expo = "Pp"
        end
        while (true) do
            if (this.check_next(expo)) then
                this.check_next("+-")
            end
            if(this.isxdigit[this.current] or this.current == 46) then
                this.save_and_next()
              else
                break
            end
        end
        local bf = {}
        for n=0, this.nbuff-1 do
            bf[n+1]=this.buff[n]
        end
        local str = string.char(table.unpack(bf))
        this.str2d(str, seminfo)
    end

    function this.skip_sep()
        local count = 0
        local s = this.current
        this.save_and_next()
        while (this.current == 61) do
            this.save_and_next()
            count=count+1
        end
        return ((this.current == s) and count) or (-count) - 1
    end

    function this.newstring(chars, offset, len )
        local bf = {}
        local i=1
        for n=offset,offset+len-1 do
            bf[i]=chars[n]
            i = i + 1
        end
        return string.char(table.unpack(bf))
    end

    function this.read_long_string(seminfo, sep)
        this.save_and_next()
        if ((this.current == 10 or this.current == 13)) then
            this.inclinenumber()
        end
        local endloop = false
        while (not endloop) do
            if this.current==-1 then
              elseif this.current==91 then
                if (this.skip_sep() == sep) then
                    this.save_and_next()
                end
              elseif this.current==93 then
                if (this.skip_sep() == sep) then
                    this.save_and_next()
                    endloop = true
                end
              elseif this.current==10 or
                this.current==13 then
                this.save(10)
                this.inclinenumber()
                if (seminfo == nil ) then
                    this.nbuff = 0
                end
              else
                this.save_and_next()
                if (seminfo ~= nil) then
                    this.save_and_next()
                  else
                    this.current = this.z.read()
                end
            end
        end
        if (seminfo ~= nil ) then
            seminfo.ts = this.newstring(this.buff, 2 + sep, this.nbuff - 2 * (2 + sep));
        end
    end

    function this.hexvalue( c)
        return (c <= 57 and c - 48) or ((c <= 70 and c + 10 - 65) or c + 10 - 97)
    end

    function this.read_string( del, seminfo)
        this.save_and_next();
        while (this.current ~= del) do
            if this.current== -1 or
                this.current==10 or
                this.current==13 then
                goto switch_continue
              elseif this.current==92 then
                local c = 0;
                this.save(this.current);
                this.current = this.z.read();

                this.save(this.current);
                this.current = this.z.read();
                goto switch_continue;
              else
                this.save_and_next();
            end
::switch_continue::
        end

        this.save_and_next();
        seminfo.ts = this.newstring(this.buff, 1, this.nbuff-2);
    end

    function this.llex(seminfo)
        this.nbuff = 0;
        while (true) do
            if this.current==10 or
                this.current== 13 then
                this.inclinenumber();
                goto switch_llex;
              elseif this.current==32 or
                this.current==12 or
                this.current==9 or
                this.current==0x0B then
                this.current = this.z.read();
                goto switch_llex;
              elseif this.current==45 then
                this.current = this.z.read();
                if (this.current ~= 45) then
                    return 45
                end
                this.current = this.z.read();
                if (this.current == 91) then
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
              elseif this.current==91 then
                local sep = this.skip_sep();
                if (sep >= 0) then
                    this.read_long_string(seminfo, sep);
                    return 292;
                  elseif (sep == -1) then
                    return 91
                end
              elseif this.current==61 then
                this.current = this.z.read();
                if (this.current ~= 61) then
                    return 61
                  else
                    this.current = this.z.read();
                    return 282;
                end
              elseif this.current==60 then
                this.current = this.z.read();
                if(this.current == 60) then
                    this.current = this.z.read();
                    return 286;
                  elseif (this.current == 61) then
                    this.current = this.z.read();
                    return 284;
                  else
                    return 60
                end
              elseif this.current==62 then
                this.current = this.z.read();
                if(this.current == 62) then
                    this.current = this.z.read();
                    return 287;
                  elseif (this.current == 61) then
                    this.current = this.z.read();
                    return 283;
                  else
                    return 62
                end
              elseif this.current==47 then
                this.current = this.z.read();
                if(this.current==47) then
                    this.current = this.z.read();
                    return 279;
                  else
                    return 47
                end
              elseif this.current==126 then
                this.current = this.z.read();
                if (this.current ~= 61) then
                    return 126
                  else
                    this.current = this.z.read();
                    return 285;
                end
              elseif this.current==58 then
                this.current = this.z.read();
                if (this.current ~= 58) then
                    return 58
                  else
                    this.current = this.z.read();
                    return 288;
                end
              elseif this.current==34 or
                this.current== 39 then
                this.read_string(this.current, seminfo);
                return 292;
              elseif this.current==46 then
                this.save_and_next();
                if (this.check_next(".")) then
                    if (this.check_next(".")) then
                        return 281;
                      else
                        return 280;
                    end
                  elseif (not this.isdigit[this.current]) then
                    return 46
                  else
                    this.read_numeral(seminfo);
                    return 290;
                end
              elseif this.current==48 or
                this.current==49 or
                this.current==50 or
                this.current==51 or
                this.current==52 or
                this.current==53 or
                this.current==54 or
                this.current==55 or
                this.current==56 or
                this.current==57 then
                this.read_numeral(seminfo);
                return 290;
              elseif this.current==-1 then
                return 289;
              else
                if ( (this.isalpha[this.current] or this.current == 95) or this.current>=128) then
                    repeat
                        this.save_and_next();
                    until (not (this.isalnum[this.current] or this.current>=128 ));

                    local ts = this.newstring(this.buff, 0, this.nbuff);
                    if (this.RESERVED[ts]) then
                        if ts~=nil then
                            local c = this.RESERVED[ts]
                            if c~= nil then
                                return c
                            end
                        end
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

    function this.next()
        if (this.lookaheadx.token ~= 289) then
            this.t.token = this.lookaheadx.token
            this.t.seminfo.r = this.lookaheadx.seminfo.r
            this.t.seminfo.ts = this.lookaheadx.seminfo.ts
            this.lookaheadx.token = 289
          else
            this.t.token = this.llex(this.t.seminfo)
        end
        this.tokennum = this.tokennum + 1
        this.alltoken[this.tokennum]={this.t.token,this.txtToken(this.t.token)}
    end

    function this.lookahead()
        this.lookaheadx.token = this.llex(this.lookaheadx.seminfo);
    end

    function this.testnext( c)
        if (this.t.token == c) then
            this.next();
            return true;
          else
            return false;
        end
    end

    function this.checknext()
        this.next();
    end

    function this.check_match(what)
        this.testnext(what);
    end

    function this.str_checkname()
        local ts = this.t.seminfo.ts
        this.next();
        return ts;
    end

    function this.checkname()
        this.str_checkname();
    end

    function this.registerlocalvar(varname)
        local fs = this.fs;
        local f = fs.f;
        if (f.locvars == nil or fs.nlocvars + 1 > #f.locvars + 1) then
            f.locvars = this.realloc( f.locvars, fs.nlocvars*2+1 );
        end
        f.locvars[fs.nlocvars] = varname
        fs.nlocvars = fs.nlocvars + 1
        return fs.nlocvars-1;
    end

    function this.new_localvar(name)
        local reg = this.registerlocalvar(name);
        if (this.dyd.actvar == nil or this.dyd.n_actvar + 1 > #this.dyd.actvar + 1) then
            this.dyd.actvar = this.realloc(this.dyd.actvar, math.max(1, this.dyd.n_actvar * 2));
        end
        this.dyd.actvar[this.dyd.n_actvar] = reg
        this.dyd.n_actvar = this.dyd.n_actvar + 1
    end

    function this.new_localvarliteral(ts)
        this.new_localvar(ts);
    end

    function this.adjustlocalvars(nvars)
        local fs = this.fs;
        fs.nactvar = (fs.nactvar + nvars);
    end

    function this.singlevar()
        local varname = this.str_checkname();
        local fs = this.fs;
        local vv = fs.singlevaraux(fs, varname, 1);
        if ( vv == 0) then
            vv = fs.singlevaraux(fs, "_ENV", 1);
        end
        return vv;
    end

    function this.open_func(fs, bl)
        fs.prev = this.fs;
        fs.ls = this;
        this.fs = fs;
        fs.nups = 0;
        fs.nlocvars = 0;
        fs.nactvar = 0;
        fs.firstlocal = this.dyd.n_actvar;
        fs.bl = nil;
        fs.enterblock(bl);
    end

    function this.close_func()
        local fs = this.fs;
        local f = fs.f;
        fs.leaveblock();
        f.locvars = this.realloc(f.locvars, fs.nlocvars);
        f.upvalues = this.realloc(f.upvalues, fs.nups);
        this.fs = fs.prev;
    end

    function this.fieldsel()
        this.next();
        this.alltoken[this.tokennum].style = "function Table:Name(Args)||Table.Name"
        this.checkname();
    end

    function this.yindex()
        this.next();
        this.expr();
        this.checknext();
    end

    function this.recfield()
        if (this.t.token == 291) then
            this.checkname();
          else
            this.yindex();
        end
        this.checknext();
        this.expr();
    end

    function this.listfield()
        this.expr();
    end

    function this.constructor()
        this.checknext();
        repeat
            if (this.t.token == 125) then
                break;
            end
            if this.t.token == 291 then
                this.lookahead();
                if (this.lookaheadx.token ~= 61) then
                    this.alltoken[this.tokennum].style = "{NAME 不为=的Op}"
                    this.listfield();
                  else
                    this.alltoken[this.tokennum].style = "{NAME=}"
                    this.recfield();
                end

              elseif this.t.token == 91 then
                this.alltoken[this.tokennum].style = "{[NAME]=}"
                this.recfield();
              else
                this.listfield();
            end

        until ( not (this.testnext(44) or this.testnext(59)) )
        this.check_match(125)
    end

    function this.parlist ()
        local fs = this.fs
        local f = fs.f
        local nparams = 0
        local is_vararg = 0
        if (this.t.token ~= 41) then
            repeat
                if this.t.token== 291 then
                    this.alltoken[this.tokennum].type = "local"
                    this.new_localvar(this.str_checkname())
                    nparams = nparams + 1
                  elseif this.t.token== 281 then
                    this.next();
                    is_vararg = 1
                end
            until ( not ((is_vararg==0) and this.testnext(44)) );
        end
        this.adjustlocalvars(nparams);
    end

    function this.body(needself)
        local new_fs = FuncState()
        local bl = {}
        new_fs.f = {upvalues={},locvars={}}
        this.open_func(new_fs, bl)
        this.checknext()
        if (needself) then
            this.new_localvarliteral("self")
            this.adjustlocalvars(1)
        end
        this.parlist();
        this.checknext();
        this.statlist();
        this.check_match(262);
        this.close_func();
    end

    function this.explist()
        this.expr()
        while (this.testnext(44)) do
            this.expr()
        end
    end

    function this.funcargs()
        if this.t.token==40 then
            this.next();
            if (this.t.token ~= 41) then
                this.explist();
            end
            this.check_match(41)
          elseif this.t.token==123 then
            this.constructor();
          elseif this.t.token== 292 then
            this.next()
        end
    end

    function this.primaryexp()
        if this.t.token==40 then
            this.next()
            this.expr()
            this.check_match(41)
            return
          elseif this.t.token==291 then
            local vv = this.singlevar()
            local types = "local"
            if vv == 0 then
                types = "global"
            end
            this.alltoken[this.tokennum-1].type = types
            return;
          else
            this.next()
        end
    end

    function this.suffixedexp()
        this.primaryexp()
        while true do
            if this.t.token==46 then
                this.fieldsel()
              elseif this.t.token==91 then
                this.yindex()
              elseif this.t.token==58 then
                this.next()
                this.alltoken[this.tokennum].style = "Var:Name(Args)"
                this.checkname()
                this.funcargs()
              elseif this.t.token==40
                or this.t.token==292
                or this.t.token==123 then
                this.funcargs()
              else
                return
            end
        end
    end

    function this.simpleexp()
        if this.t.token==290 or
            this.t.token==292 or
            this.t.token==270 or
            this.t.token==276 or
            this.t.token==263 or
            this.t.token==281 then
          elseif this.t.token== 123 then
            this.constructor();
            return;
          elseif this.t.token==265 then
            this.next();
            this.body(false);
            return;
          else
            this.suffixedexp();
            return;
        end
        this.next();
    end

    function this.getunopr( op)
        if op== 271 then
            return 1;
          elseif op==45 then
            return 0;
          elseif op==35 then
            return 2;
          elseif op==126 then
            return 4;
          else
            return 3;
        end
    end

    function this.getbinopr( op )
        if op==43 then
            return 0;
          elseif op==45 then
            return 1;
          elseif op==42 then
            return 2;
          elseif op==47 then
            return 5;
          elseif op==37 then
            return 3;
          elseif op==94 then
            return 4;
          elseif op==280 then
            return 12;
          elseif op==285 then
            return 16;
          elseif op==282 then
            return 13;
          elseif op==60 then
            return 14;
          elseif op==284 then
            return 15;
          elseif op==62 then
            return 17;
          elseif op==283 then
            return 18;
          elseif op==257 then
            return 19;
          elseif op==272 then
            return 20;
          elseif op==279 then
            return 6;
          elseif op==38 then
            return 7;
          elseif op==124 then
            return 8;
          elseif op==126 then
            return 9;
          elseif op==286 then
            return 10;
          elseif op==287 then
            return 11;
          else
            return 21;
        end
    end

    this.priority = {
        [0]={10, 10}, {10, 10},
        {11, 11}, {11, 11},
        {14, 13},
        {11, 11}, {11, 11},
        {6, 6}, {4, 4}, {5, 5},
        {7, 7}, {7, 7},
        {9, 8},
        {3, 3}, {3, 3}, {3, 3},
        {3, 3}, {3, 3}, {3, 3},
        {2, 2}, {1, 1},
        {1, 1}
    };
    this.UNARY_PRIORITY = 8

    function this.subexpr(limit)
        local op = nil
        local uop = nil
        uop = this.getunopr(this.t.token)
        if (uop ~= 3) then
            this.next()
            this.subexpr(this.UNARY_PRIORITY)
          else
            this.simpleexp()
        end
        op = this.getbinopr(this.t.token)
        while (op ~= 21 and this.priority[op][1] > limit) do
            this.next()
            op = this.subexpr( this.priority[op][2])
        end
        return op
    end

    function this.expr()
        this.subexpr(0)
    end

    this.following_t = {
        [260] = true,
        [261] = true,
        [262] = true,
        [289] = true,
    }
    function this.block_follow(withuntil)
        this.following_t[277] = withuntil
        return this.following_t[this.t.token]
    end

    function this.block()
        local fs = this.fs
        local bl = {}
        fs.enterblock(bl)
        this.statlist()
        fs.leaveblock()
    end

    function this.assignment()
        if (this.testnext(44)) then
            this.suffixedexp()
            this.assignment()
          else
            this.checknext()
            this.explist()
        end
    end

    function this.cond()
        this.expr()
    end

    function this.gotostat()
        if (this.testnext(266)) then
            this.alltoken[this.tokennum-1].style = "goto Name"
            this.str_checkname()
          else
            this.next()
        end
    end

    function this.skipnoopstat()
        while (this.t.token == 59 or this.t.token == 288) do
            this.statement()
        end
    end

    function this.labelstat()
        this.checknext()
        this.skipnoopstat()
    end

    function this.whilestat()
        local fs = this.fs
        local bl = {}
        this.next()
        this.cond()
        fs.enterblock(bl)
        this.checknext()
        this.block()
        this.check_match(262)
        fs.leaveblock()
    end

    function this.repeatstat()
        local fs = this.fs
        local bl1 = {}
        local bl2 = {}
        fs.enterblock(bl1)
        fs.enterblock(bl2)
        this.next()
        this.statlist()
        this.check_match(277)
        this.cond()
        fs.leaveblock()
        fs.leaveblock()
    end

    function this.exp1()
        this.expr()
    end

    function this.forbody(nvars)
        local bl = {}
        local fs = this.fs
        this.adjustlocalvars(3)
        this.checknext()
        fs.enterblock(bl)
        this.adjustlocalvars(nvars)
        this.block()
        fs.leaveblock()
    end


    function this.fornum(varname)
        this.new_localvarliteral("(for index)")
        this.new_localvarliteral("(for limit)")
        this.new_localvarliteral("(for step)")
        this.new_localvar(varname)
        this.alltoken[this.tokennum-1].type = "local"
        this.checknext()
        this.exp1()
        this.checknext()
        this.exp1()
        if (this.testnext(',')) then
            this.exp1()
        end
        this.forbody(1)
    end

    function this.forlist(indexname)
        local nvars = 4
        this.new_localvarliteral("(for generator)")
        this.new_localvarliteral("(for state)")
        this.new_localvarliteral("(for control)")
        this.new_localvar(indexname)
        this.alltoken[this.tokennum-1].type = "local"
        while (this.testnext(',')) do
            this.new_localvar(this.str_checkname())
            this.alltoken[this.tokennum-1].type = "local"
            nvars = nvars + 1
        end
        this.checknext()
        this.explist()
        this.forbody(nvars - 3)
    end

    function this.forstat()
        local fs = this.fs
        local bl = {}
        fs.enterblock(bl)
        this.next()
        local varname = this.str_checkname()
        if this.t.token==61 then
            this.fornum(varname)
          elseif this.t.token==44 or
            this.t.token== 268 then
            this.forlist(varname)
        end
        this.check_match(262)
        fs.leaveblock()
    end

    function this.test_then_block()
        local bl = {}
        this.next()
        this.expr()
        this.checknext()
        if (this.t.token == 266 or this.t.token == 258) then
            this.fs.enterblock(bl)
            this.gotostat()
            this.skipnoopstat()
            if (this.block_follow(false)) then
                this.fs.leaveblock()
                return
            end
          else
            this.fs.enterblock(bl)
        end
        this.statlist()
        this.fs.leaveblock()
    end

    function this.ifstat()
        this.test_then_block()
        while (this.t.token == 261) do
            this.test_then_block()
        end
        if (this.testnext(260)) then
            this.block()
        end
        this.check_match(262)
    end

    function this.localfunc()
        this.new_localvar(this.str_checkname())
        this.alltoken[this.tokennum-1].type = "local"
        this.adjustlocalvars(1)
        this.body(false)
    end

    function this.localstat()
        local nvars = 0
        repeat
            this.new_localvar(this.str_checkname())
            this.alltoken[this.tokennum-1].type = "local"
            nvars=nvars+1
        until ( not (this.testnext(44)))
        if (this.testnext(61)) then
            this.explist()
        end
        this.adjustlocalvars(nvars)
    end

    function this.funcname()
        local ismethod = false
        local vv = this.singlevar()
        local types = "local"
        if vv == 0 then
            types = "global"
        end
        this.alltoken[this.tokennum-1].type = types
        while (this.t.token == 46) do
            this.fieldsel()
        end
        if (this.t.token == 58) then
            ismethod = true
            this.fieldsel()
        end
        return ismethod
    end

    function this.funcstat()
        this.next()
        this.body(this.funcname())
    end

    function this.exprstat()
        this.suffixedexp()
        if (this.t.token == 61 or this.t.token == 44) then
            this.assignment()
        end
    end

    function this.retstat()
        if (not (this.block_follow(true) or this.t.token == 59) ) then
            this.explist()
        end
        this.testnext(59)
    end

    function this.statement()
        if this.t.token== 59 then
            this.next()
          elseif this.t.token== 267 then
            this.ifstat()
          elseif this.t.token==278 then
            this.whilestat()
          elseif this.t.token==259 then
            this.next()
            this.block()
            this.check_match(262)
          elseif this.t.token== 264 then
            this.forstat()
          elseif this.t.token==273 then
            this.repeatstat()
          elseif this.t.token==265 then
            this.funcstat()
          elseif this.t.token==269 then
            this.next()
            if (this.testnext(265)) then
                this.localfunc()
              else
                this.localstat()
            end
          elseif this.t.token==288 then
            this.next()
            this.alltoken[this.tokennum].style = "::Name::"
            this.str_checkname()
            this.labelstat()
          elseif this.t.token==274 then
            this.next()
            this.retstat()
          elseif this.t.token==258 or
            this.t.token==266 then
            this.gotostat()
          else
            this.exprstat()
        end
    end

    function this.statlist()
        while (not this.block_follow(true)) do
            if (this.t.token == 274) then
                this.statement()
                return
            end
            this.statement()
        end
    end

    function this.mainfunc(funcstate)
        this.open_func(funcstate, {})
        this.fs.newupvalue("_ENV")
        this.next()
        this.statlist()
        this.close_func()
        for n=#this.alltoken,1,-1 do
            if this.alltoken[n][1]==-1 or this.alltoken[n][1]==289 or this.alltoken[n][1]==292 + 1 then
                this.alltoken[n] = nil
              else
                break
            end
        end
    end

end)

---class Llex---
function Llex(z)
    local lexstate = LexState()
    local funcstate = FuncState()
    lexstate.fs = funcstate
    lexstate.setinput(z)
    funcstate.f = {upvalues={},locvars={}}
    lexstate.mainfunc(funcstate)
    return lexstate
end

RESERVED = {
    ['..'] = 280,
    ['...'] = 281,
    ['//'] = 279,
    ['::'] = 288,
    ['<<'] = 286,
    ['<='] = 284,
    ['<eos>'] = 289,
    ['<integer>'] = 291,
    ['<name>'] = 292,
    ['<number>'] = 290,
    ['<string>'] = 293,
    ['=='] = 282,
    ['>='] = 283,
    ['>>'] = 287,
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
    ['~='] = 285,
}

--处理方式--
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

--无多余空格的单行压缩
function oneLine(ls)
    local x = ls.alltoken
    local code = ""
    local content = ""
    for k,v in ipairs(x) do
        content = v[2]
        if RESERVED[content] then
            code = code.." "..content.." "
          elseif (content == "]" or content == ")" or content == "}" or v[1]==315 or v[1]==316 or v[1]==317) and x[k+1] and x[k+1][1]==316 then
            code = code..content.." "
          elseif content == ","or content==";" then
            code = code..content.." "
          else
            code = code..content
        end
    end
    return code
end

--带空格的单行压缩
function oneLine2(ls)
    local x = ls.alltoken
    local code = ""
    for k,v in ipairs(x) do
        code = code.." "..v[2].." "
    end
    return code
end

--正常缩进
function restoreLine(ls)
    local x = ls.alltoken
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

--其他函数--
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

--调用区--
local Code = gg.prompt({"待格式化脚本","输出路径"}, {"/sdcard/Notes/file.lua","/sdcard/Notes/"},{"file","path"})

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
Sys = luajava.bindClass("java.lang.System")
--local time1 = os.time()
local time1 = Sys.currentTimeMillis()
local ls = Llex(code)
code = restoreLine(ls)--格式化
local u=io.open(outpath,"w+")
u:write(code)
u:close()
--print(ls.alltoken)
--alltoken为Lua代码分词（token）列表{[key]=value,}
--key从1开始排到Lua代码的最后一个有效token
--value为一个表，表中[1]为token类型（如TK_STRING）的十进制值
--[2]为该token对应的实际代码，可对这些代码进行处理，并拼接为Lua源代码
--["type"]表示TK_NAME类型的token是全局变量还是局部变量，global为全局，local为局部变量
--["style"]表示TK_NAME类型在代码中出现的格式
--type和style值均用于辅助处理变量的混淆
--local time2 = os.time()
local time2 = Sys.currentTimeMillis()
--gg.alert("运行时长"..(time2-time1).."秒")
gg.alert("运行时长"..(time2-time1).."毫秒")