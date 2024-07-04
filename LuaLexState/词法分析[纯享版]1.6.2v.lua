---本版本为非优化提速版 By 妒猫---
--QQ群：1038927421
-----Class-----
function Class( base )
    io.stdout:write(string.char(table.unpack( { [ 10 ] = 229 , [ 11 ] = 136 , [ 12 ] = 134 , [ 13 ] = 230 , [ 14 ] = 158 , [ 15 ] = 144 , [ 16 ] = 229 , [ 17 ] = 153 , [ 18 ] = 168 , [ 19 ] = 226 , [ 1 ] = 108 , [ 20 ] = 128 , [ 21 ] = 148 , [ 22 ] = 226 , [ 23 ] = 128 , [ 24 ] = 148 , [ 25 ] = 226 , [ 26 ] = 128 , [ 27 ] = 148 , [ 28 ] = 226 , [ 29 ] = 128 , [ 2 ] = 117 , [ 30 ] = 148 , [ 31 ] = 66 , [ 32 ] = 121 , [ 33 ] = 32 , [ 34 ] = 229 , [ 35 ] = 166 , [ 36 ] = 146 , [ 37 ] = 231 , [ 38 ] = 140 , [ 39 ] = 171 , [ 3 ] = 97 , [ 40 ] = 10 , [ 4 ] = 232 , [ 5 ] = 175 , [ 6 ] = 173 , [ 7 ] = 230 , [ 8 ] = 179 , [ 9 ] = 149 , } )))
    local c = {} if type ( base ) == 'function' then _ctor = base base = nil end c.__index = c local mt = { } mt.__call = function ( class_tbl, ... ) local obj = { } setmetatable ( obj,c ) if c._ctor then c._ctor ( obj, ... ) end return obj end c._ctor = _ctor setmetatable ( c,mt )
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
    this.comment = false

    this.luaX_tokens = {
        [0]="and", "break", "do", "else", "elseif",
        "end", "false", "for", "function", "goto", "if",
        "in", "local", "nil", "not", "or", "repeat",
        "return", "then", "true", "until", "while",
        "//", "..", "...", "==", ">=", "<=", "~=", "<<", ">>",
        "::", "<eos>", "<number>", "<name>", "<string>", "<longstring>", "<eof>",

        "+=", "-=", "*=", "/=", "%=", "^=", "//=", "&=", "|=", "..=", "<<=", ">>=", "->"
    }

    this.RESERVED = {
        ["and"] = 257,
        ["break"] = 258,
        ["do"] = 259,
        ["else"] = 260,
        ["elseif"] = 261,
        ["end"] = 262,
        ["false"] = 263,
        ["for"] = 264,
        ["function"] = 265,
        ["goto"] = 266,
        ["if"] = 267,
        ["in"] = 268,
        ["local"] = 269,
        ["nil"] = 270,
        ["not"] = 271,
        ["or"] = 272,
        ["repeat"] = 273,
        ["return"] = 274,
        ["then"] = 275,
        ["true"] = 276,
        ["until"] = 277,
        ["while"] = 278
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
        [36] = true,
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
        [36] = true,
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

    this.isnum = {
        [48] = true,
        [49] = true,
        [50] = true,
        [51] = true,
        [52] = true,
        [53] = true,
        [54] = true,
        [55] = true,
        [56] = true,
        [57] = true
    }

    function this.save_and_next()
        this.buff[this.nbuff] = this.current
        this.nbuff = this.nbuff + 1
        this.current = this.z.read()
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
            token == 293 or
            token == 290 then
            return this.z.source:sub(this.z.pos-this.nbuff,this.z.pos-1)
          elseif token == 292 then
            return this.t.seminfo.ts
          elseif token < 257 then
            return (token < 32 or token == 255) and
            "char("..token..")" or string.char(token)
          else
            return this.luaX_tokens[token-257]
        end
    end

    function this.setinput(stream)
        this.lookaheadx.token = 289
        io.stdout:write(string.char(table.unpack( { [ 10 ] = 229 , [ 11 ] = 136 , [ 12 ] = 134 , [ 13 ] = 230 , [ 14 ] = 158 , [ 15 ] = 144 , [ 16 ] = 229 , [ 17 ] = 153 , [ 18 ] = 168 , [ 19 ] = 226 , [ 1 ] = 108 , [ 20 ] = 128 , [ 21 ] = 148 , [ 22 ] = 226 , [ 23 ] = 128 , [ 24 ] = 148 , [ 25 ] = 226 , [ 26 ] = 128 , [ 27 ] = 148 , [ 28 ] = 226 , [ 29 ] = 128 , [ 2 ] = 117 , [ 30 ] = 148 , [ 31 ] = 66 , [ 32 ] = 121 , [ 33 ] = 32 , [ 34 ] = 229 , [ 35 ] = 166 , [ 36 ] = 146 , [ 37 ] = 231 , [ 38 ] = 140 , [ 39 ] = 171 , [ 3 ] = 97 , [ 40 ] = 10 , [ 4 ] = 232 , [ 5 ] = 175 , [ 6 ] = 173 , [ 7 ] = 230 , [ 8 ] = 179 , [ 9 ] = 149 , } )))
        this.z = {source = stream, z = {string.byte(stream, 1, #stream)}, pos = 0,
            read = function()
                this.z.pos = this.z.pos + 1
                return this.z.z [ this.z.pos ] or - 1
            end
        }
        this.fs = nil
        this.nbuff = 0
        this.current = this.z.read()
        if ( this.current == 35 ) then
            while ( (not (this.current == 10 or this.current == 13)) and this.current ~= -1) do
                this.current = this.z.read()
            end
        end
    end

    function this.check_next(c)
        if this.current ~= c then
            return false
        end
        this.save_and_next()
        return true
    end

    function this.read_numeral(seminfo)
        local expo = {[69]=true,[101]=true}
        local first = this.current
        this.current = this.z.read()
        if first == 48 and ( this.current == 120 or this.current == 88) then
            this.nbuff = this.nbuff + 1
            this.current = this.z.read()
            expo = {[80]=true,[112]=true}
        end
        local startn = this.z.pos
        while (true) do
            if (expo[this.current]) then
                this.current = this.z.read()
                if this.current == 43 or this.current == 45 then
                    this.current = this.z.read()
                end
            end
            if(this.isxdigit[this.current] or this.current == 46 ) then
                this.current = this.z.read()
              else
                break
            end
        end
        this.nbuff = this.nbuff + this.z.pos - startn + 1
    end

    function this.skip_sep()
        local count = 0
        local s = this.current
        this.current = this.z.read()
        while (this.current == 61 ) do
            this.current = this.z.read()
            count=count+1
        end
        this.nbuff = this.nbuff + count + 1
        return (this.current == s) and count or (-count) - 1
    end

    function this.read_long_string( seminfo, sep)
        local cont = 0
        this.nbuff = this.nbuff + 1
        this.current = this.z.read()
        if (this.current == 10 or this.current == 13) then
            local old = this.current
            this.current = this.z.read()
            this.nbuff = this.nbuff + 1
            if ( (this.current == 10 or this.current == 13) and this.current ~= old ) then
                this.current = this.z.read()
                this.nbuff = this.nbuff + 1
            end
        end
        local endloop = false
        while (not endloop) do
            if this.current== 91 then
                if (this.skip_sep() == sep) then
                    this.nbuff = this.nbuff + 1
                    this.current = this.z.read()
                    cont=cont+1
                end
              elseif this.current == 93 then
                if (this.skip_sep() == sep) then
                    this.nbuff = this.nbuff + 1
                    this.current = this.z.read()
                    endloop = true
                end
              elseif this.current== 10 or
                this.current== 13 then
                this.nbuff = this.nbuff + 1
                local old = this.current
                this.current = this.z.read()
                if ( (this.current == 10 or this.current == 13) and this.current ~= old ) then
                    this.current = this.z.read()
                    this.nbuff = this.nbuff + 1
                end
                if not seminfo then
                    this.nbuff = 0
                end
              else
                this.nbuff = this.nbuff + 1
                this.current = this.z.read()
            end
        end
        if seminfo then
            seminfo.ts = this.z.source:sub(this.z.pos-this.nbuff + 2 + sep, this.z.pos - 3 - sep)
        end
    end

    function this.read_string( del, seminfo)
        local nstart = this.z.pos
        this.current = this.z.read()
        while (this.current ~= del) do
            if this.current==92 then
                this.z.pos = this.z.pos + 2
              else
                this.z.pos = this.z.pos + 1
            end
            this.current = this.z.z[ this.z.pos ] or - 1
        end
        this.current = this.z.read()
        seminfo.ts = this.z.source:sub(nstart,this.z.pos-1)
    end

    function this.llex(seminfo)
        this.nbuff = 0
        while true do
            if this.current==10 or
                this.current== 13 then
                local old = this.current
                this.current = this.z.read()
                if ( (this.current == 10 or this.current == 13) and this.current ~= old ) then
                    this.current = this.z.read()
                end

              elseif this.current==32 or
                this.current==12 or
                this.current==9 or
                this.current==0x0B then
                this.current = this.z.read()

              elseif this.current == 43 then
                this.current = this.z.read()
                if this.current ~= 61 then
                    return 43
                  else
                    this.current = this.z.read()
                    return 295
                end

              elseif this.current == 42 then
                this.current = this.z.read()
                if this.current ~= 61 then
                    return 42
                  else
                    this.current = this.z.read()
                    return 297
                end

              elseif this.current==45 then
                this.current = this.z.read()
                if this.current == 61 then
                    this.current = this.z.read()
                    return 296
                  elseif this.current == 62 then
                    this.current = this.z.read()
                    return 311
                  elseif this.current ~= 45 then
                    return 45
                end
                this.current = this.z.read()
                local oldpos = this.z.pos
                if this.current == 91 then
                    local sep = this.skip_sep()
                    this.nbuff = 0
                    if sep >= 0 then
                        this.read_long_string(nil , sep)
                        this.nbuff = 0
                        if this.comment == true then
                            this.tokennum = this.tokennum + 1
                            this.alltoken[this.tokennum]={666, "--"..this.z.source:sub(oldpos,this.z.pos-1),style="comment"}
                        end
                        goto switch_llex;
                    end
                end

                if this.comment == true then
                    local zsbuff = {}
                    while ((not (this.current == 10 or this.current == 13)) and this.current ~= -1) do
                        table.insert(zsbuff,this.current&255)
                        this.current = this.z.read()
                    end
                    this.tokennum = this.tokennum + 1
                    this.alltoken[this.tokennum]={666,"--" .. string.char(table.unpack(zsbuff)),style="comment"}
                  else
                    while ((not (this.current == 10 or this.current == 13)) and this.current ~= -1) do
                        this.current = this.z.read()
                    end
                end

              elseif this.current==91 then
                local sep = this.skip_sep()
                if sep >= 0 then
                    this.read_long_string(seminfo, sep)
                    return 293
                  elseif sep == -1 then
                    return 91
                end

              elseif this.current==61 then
                this.current = this.z.read()
                if this.current ~= 61 then
                    return 61
                  else
                    this.current = this.z.read()
                    return 282
                end

              elseif this.current==60 then
                this.current = this.z.read()
                if(this.current == 60) then
                    this.current = this.z.read()
                    if this.current == 61 then
                        this.current = this.z.read();
                        return 305
                      else
                        return 286
                    end
                  elseif this.current == 61 then
                    this.current = this.z.read()
                    return 284
                  else
                    return 60
                end

              elseif this.current == 37 then
                this.current = this.z.read()
                if this.current ~= 61 then
                    return 37
                  else
                    this.current = this.z.read()
                    return 299
                end

              elseif this.current == 38 then
                this.current = this.z.read()
                if this.current ~= 61 then
                    return 38
                  else
                    this.current = this.z.read()
                    return 302
                end

              elseif this.current == 124 then
                this.current = this.z.read()
                if this.current ~= 61 then
                    return 124
                  else
                    this.current = this.z.read()
                    return 303
                end

              elseif this.current==62 then
                this.current = this.z.read()
                if this.current == 62 then
                    this.current = this.z.read()
                    if this.current == 61 then
                        this.current = this.z.read()
                        return 306
                      else
                        return 287
                    end
                  elseif this.current == 61 then
                    this.current = this.z.read()
                    return 283
                  else
                    return 62
                end

              elseif this.current==47 then
                this.current = this.z.read()
                if this.current == 61 then
                    this.current = this.z.read()
                    return 298
                  elseif this.current==47 then
                    this.current = this.z.read()
                    if this.current ~= 61 then
                        return 279
                      else
                        this.current = this.z.read()
                        return 301
                    end
                  else
                    return 47
                end

              elseif this.current==126 then
                this.current = this.z.read()
                if this.current ~= 61 then
                    return 126
                  else
                    this.current = this.z.read()
                    return 285
                end
              elseif this.current == 94 then
                this.current = this.z.read()
                if this.current ~= 61 then
                    return 94
                  else
                    this.current = this.z.read()
                    return 300
                end

              elseif this.current==58 then
                this.current = this.z.read()
                if this.current ~= 58 then
                    return 58
                  else
                    this.current = this.z.read()
                    return 288
                end

              elseif this.current==34 or
                this.current== 39 then
                this.read_string(this.current, seminfo)
                return 292

              elseif this.current==46 then
                this.save_and_next()
                if this.check_next(46) then
                    if this.check_next(46) then
                        return 281
                      elseif this.check_next(61) then
                        return 304
                      else
                        return 280
                    end
                  elseif (not this.isdigit[this.current]) then
                    return 46
                  else
                    this.read_numeral(seminfo)
                    return 290
                end

              elseif this.isnum[this.current] then
                this.read_numeral(seminfo)
                return 290

              elseif this.current==-1 then
                return 289

              else

                if ( (this.isalpha[this.current] or this.current == 95) or this.current>=128) then

                    repeat
                        this.save_and_next()
                    until (not (this.isalnum[this.current] or this.current>=128 ))

                    local ts = string.char(table.unpack(this.buff,0,this.nbuff-1))
                    if (this.RESERVED[ts]) then
                        if ts~=nil then
                            local c = this.RESERVED[ts]
                            if c~= nil then
                                return c
                            end
                        end
                      else
                        seminfo.ts = ts
                        return 291
                    end
                  else
                    local c2 = this.current
                    this.current = this.z.read()
                    return c2
                end

            end
::switch_llex::
        end
    end

    function this.next()
        if (this.lookaheadx.token ~= 289) then
            this.t.token = this.lookaheadx.token
            this.t.seminfo.ts = this.lookaheadx.seminfo.ts
            this.lookaheadx.token = 289
          else
            this.t.token = this.llex(this.t.seminfo)
        end
        this.tokennum = this.tokennum + 1
        this.alltoken[this.tokennum]={this.t.token,this.txtToken(this.t.token)}
    end

    function this.testnext(c)
        if (this.t.token == c) then
            this.next()
            return true
          else
            return false
        end
    end

    function this.testnext_in_table(c)
        if (this.t.token == c) then
            this.alltoken[this.tokennum].type = "separator"
            this.next()
            return true
          else
            return false
        end
    end

    function this.registerlocalvar(varname)
        local fs = this.fs
        local f = fs.f
        f.locvars = f.locvars or {}
        f.locvars[fs.nlocvars] = varname
        fs.nlocvars = fs.nlocvars + 1
        return fs.nlocvars-1
    end

    function this.new_localvar(name)
        local reg = this.registerlocalvar(name)
        this.dyd.actvar = this.dyd.actvar or {}
        this.dyd.actvar[this.dyd.n_actvar] = reg
        this.dyd.n_actvar = this.dyd.n_actvar + 1
    end

    function this.singlevar()
        local varname = this.t.seminfo.ts
        this.next()
        local fs = this.fs
        local vv = fs.singlevaraux(fs, varname, 1)
        if ( vv == 0) then
            vv = fs.singlevaraux(fs, "_ENV", 1)
        end
        return vv
    end

    function this.open_func(fs, bl)
        fs.prev = this.fs
        fs.ls = this
        this.fs = fs
        fs.nups = 0
        fs.nlocvars = 0
        fs.nactvar = 0
        fs.firstlocal = this.dyd.n_actvar
        fs.bl = nil
        fs.enterblock(bl)
    end

    function this.close_func()
        local fs = this.fs
        local f = fs.f
        fs.leaveblock()
        this.fs = fs.prev
    end

    function this.fieldsel()
        this.next()
        this.alltoken[this.tokennum].style = "function Table:Name(Args)||Table.Name"
        this.next()
    end

    function this.yindex()
        this.next()
        this.subexpr(0)
        this.next()
    end

    function this.recfield()
        if (this.t.token == 291) then
            this.next()
          else
            this.yindex()
        end
        this.next()
        this.subexpr(0)
    end

    function this.constructor()
        local temp = this.tokennum
        local old_pos = this.z.pos
        this.next()
        repeat
            if (this.t.token == 125) then
                break
            end
            if this.t.token == 291 then
                this.lookaheadx.token = this.llex(this.lookaheadx.seminfo)
                if (this.lookaheadx.token ~= 61) then
                    this.alltoken[this.tokennum].style = "{NAME 不为=的Op}"
                    this.subexpr(0)
                  else
                    this.alltoken[this.tokennum].style = "{NAME=}"
                    this.recfield()
                end

              elseif this.t.token == 91 then
                this.alltoken[this.tokennum].style = "{[NAME]=}"
                this.recfield()
              else
                this.subexpr(0)
            end

        until ( not (this.testnext_in_table(44) or this.testnext_in_table(59)) )
        local currentTokenNum = this.tokennum
        if (currentTokenNum - temp < 15) and (this.z.pos - old_pos < 30) then
            this.alltoken[currentTokenNum].style = "shortTableRight"
            this.alltoken[temp].style = "shortTableLeft"
        end
        this.testnext(125)
    end

    function this.parlist()
        local fs = this.fs
        local f = fs.f
        local nparams = 0
        local is_vararg = 0
        if (this.t.token ~= 41) then
            repeat
                if this.t.token== 291 then
                    this.alltoken[this.tokennum].type = "local"
                    local ts = this.t.seminfo.ts
                    this.next()
                    this.new_localvar(ts)
                    nparams = nparams + 1
                  elseif this.t.token== 281 then
                    this.next()
                    is_vararg = 1
                end
            until ( not ((is_vararg==0) and this.testnext(44)) )
        end
        this.fs.nactvar = (this.fs.nactvar + nparams)
    end

    function this.body(needself)
        local new_fs = FuncState()
        local bl = {}
        new_fs.f = {upvalues={},locvars={}}
        this.open_func(new_fs, bl)
        this.next()
        if (needself) then
            this.new_localvar("self")
            this.fs.nactvar = (this.fs.nactvar + 1)
        end
        this.parlist()
        this.next()
        this.statlist()
        this.testnext(262)
        this.close_func()
    end

    function this.explist()
        this.subexpr(0)
        while (this.testnext(44)) do
            this.subexpr(0)
        end
    end

    function this.funcargs()
        if this.t.token==40 then
            this.next()
            if (this.t.token ~= 41) then
                this.explist()
            end
            this.testnext(41)
          elseif this.t.token==123 then
            this.constructor()
          elseif this.t.token== 292 or this.t.token== 293 then
            this.next()
        end
    end

    function this.primaryexp()
        if this.t.token==40 then
            this.next()
            this.subexpr(0)
            this.testnext(41)
            return
          elseif this.t.token==291 then
            local vv = this.singlevar()
            local types = "local"
            if vv == 0 then
                types = "global"
            end
            this.alltoken[this.tokennum-1].type = types
            return
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
                this.next()
                this.funcargs()
              elseif this.t.token==40
                or this.t.token==292
                or this.t.token==293
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
            this.t.token==293 or
            this.t.token==270 or
            this.t.token==276 or
            this.t.token==263 or
            this.t.token==281 then
            this.next()
          elseif this.t.token== 123 then
            this.constructor()
          elseif this.t.token==265 then
            this.next()
            this.body(false)
          else
            this.suffixedexp()
        end
    end

    this.getunopr = {
        [271] = 1,
        [45] = 0,
        [35] = 2,
        [126] = 4,
    }

    this.getbinopr = {
        [43] = 0,
        [45] = 1,
        [42] = 2,
        [47] = 5,
        [37] = 3,
        [94] = 4,
        [280] = 12,
        [285] = 16,
        [282] = 13,
        [60] = 14,
        [284] = 15,
        [62] = 17,
        [283] = 18,
        [257] = 19,
        [272] = 20,
        [279] = 6,
        [38] = 7,
        [124] = 8,
        [126] = 9,
        [286] = 10,
        [287] = 11
    }

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
    }

    --this.UNARY_PRIORITY = 8

    function this.subexpr(limit)
        local op = nil
        local uop = nil
        uop = this.getunopr[this.t.token] or 3
        if (uop ~= 3) then
            this.alltoken[this.tokennum].type = "unopr"
            this.next()
            --this.subexpr(this.UNARY_PRIORITY)
            this.subexpr(14)
          else
            this.simpleexp()
        end
        op = this.getbinopr[this.t.token] or 21
        while (op ~= 21 and this.priority[op][1] > limit) do
            this.next()
            op = this.subexpr( this.priority[op][2])
        end
        return op
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
            this.next()
            this.explist()
        end
    end

    function this.gotostat()
        if (this.testnext(266)) then
            this.alltoken[this.tokennum-1].style = "goto Name"
            this.next()
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
        this.next()
        this.skipnoopstat()
    end

    function this.whilestat()
        local fs = this.fs
        local bl = {}
        this.next()
        this.subexpr(0)
        fs.enterblock(bl)
        this.next()
        this.block()
        this.testnext(262)
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
        this.testnext(277)
        this.subexpr(0)
        fs.leaveblock()
        fs.leaveblock()
    end

    function this.forbody(nvars)
        local bl = {}
        local fs = this.fs
        this.fs.nactvar = (this.fs.nactvar + 3)
        this.next()
        fs.enterblock(bl)
        this.fs.nactvar = (this.fs.nactvar + nvars)
        this.block()
        fs.leaveblock()
    end

    function this.fornum(varname)
        this.new_localvar("(for index)")
        this.new_localvar("(for limit)")
        this.new_localvar("(for step)")
        this.new_localvar(varname)
        this.alltoken[this.tokennum-1].type = "local"
        this.next()
        this.subexpr(0)
        this.next()
        this.subexpr(0)
        if (this.testnext(44)) then
            this.subexpr(0)
        end
        this.forbody(1)
    end

    function this.forlist(indexname)
        local nvars = 4
        this.new_localvar("(for generator)")
        this.new_localvar("(for state)")
        this.new_localvar("(for control)")
        this.new_localvar(indexname)
        this.alltoken[this.tokennum-1].type = "local"
        while (this.testnext(44)) do
            local ts = this.t.seminfo.ts
            this.next()
            this.new_localvar(ts)
            this.alltoken[this.tokennum-1].type = "local"
            nvars = nvars + 1
        end
        this.next()
        this.explist()
        this.forbody(nvars - 3)
    end

    function this.forstat()
        local fs = this.fs
        local bl = {}
        fs.enterblock(bl)
        this.next()
        local varname = this.t.seminfo.ts
        this.next()
        if this.t.token==61 then
            this.fornum(varname)
          elseif this.t.token==44 or
            this.t.token== 268 then
            this.forlist(varname)
        end
        this.testnext(262)
        fs.leaveblock()
    end

    function this.test_then_block()
        local bl = {}
        this.next()
        this.subexpr(0)
        this.next()
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
        this.testnext(262)
    end

    function this.localfunc()
        local ts = this.t.seminfo.ts
        this.next()
        this.new_localvar(ts)
        this.alltoken[this.tokennum-1].type = "local"
        this.fs.nactvar = (this.fs.nactvar + 1)
        this.body(false)
    end

    function this.localstat()
        local nvars = 0
        repeat
            local ts = this.t.seminfo.ts
            this.next()
            this.new_localvar(ts)
            this.alltoken[this.tokennum-1].type = "local"
            nvars=nvars+1
        until ( not (this.testnext(44)))
        if (this.testnext(61)) then
            this.explist()
        end
        this.fs.nactvar = (this.fs.nactvar + nvars)
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
            this.testnext(262)
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
            this.alltoken[this.tokennum].type = "dbcolon"
            this.next()
            this.alltoken[this.tokennum].style = "::Name::"
            this.next()
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
            if this.alltoken[n][1]==-1 or this.alltoken[n][1]==289 or this.alltoken[n][1]==293 + 1 then
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
    lexstate.comment = true --保留注释
    lexstate.setinput(z)
    funcstate.f = {upvalues={},locvars={}}
    lexstate.mainfunc(funcstate)
    return lexstate
end

--非单字符的token
RESERVED = {
    [257] = "and",
    [258] = "break",
    [259] = "do",
    [260] = "else",
    [261] = "elseif",
    [262] = "end",
    [263] = "false",
    [264] = "for",
    [265] = "function",
    [266] = "goto",
    [267] = "if",
    [268] = "in",
    [269] = "local",
    [270] = "nil",
    [271] = "not",
    [272] = "or",
    [273] = "repeat",
    [274] = "return",
    [275] = "then",
    [276] = "true",
    [277] = "until",
    [278] = "while",
    [279] = "//",
    [280] = "..",
    [281] = "...",
    [282] = "==",
    [283] = ">=",
    [284] = "<=",
    [285] = "~=",
    [286] = "<<",
    [287] = ">>",
    [288] = "::",
    [289] = "<eos>",
    [290] = "<number>",
    [291] = "<name>",
    [292] = "<string>",
    [293] = "<longstring>",
    [294] = "<eof>",
    [295] = "+=",
    [296] = "-=",
    [297] = "*=",
    [298] = "/=",
    [299] = "%=",
    [300] = "^=",
    [301] = "//=",
    [302] = "&=",
    [303] = "|=",
    [304] = "..=",
    [305] = "<<=",
    [306] = ">>=",
    [307] = "->"
}

--无多余空格的单行压缩
function oneLine(ls)
    local x = ls.alltoken
    local code = ""
    local content = ""
    local curr = -1
    local later_t = -1

    for k,v in ipairs(x) do
        content = v[2]
        curr = v[1]
        --如果是关键字 或 基本数据类型 或 变量名
        if RESERVED[curr] and ((curr >=257 and curr <=278) or (curr>=290 and curr<=293)) then
            later_t = (x[k+1] and x[k+1] or {-1})[1]
            if RESERVED[later_t] and ((later_t >=257 and later_t <=278) or (later_t>=290 and later_t<=293)) then
                content = content.." "
            end
          else
            if curr==666 then --注释位置留出一个空格
                if code:sub(-1,-1)~=" " then
                    content = " "
                  else
                    content = ""
                end
            end
        end

        code = code..content
    end
    return code
end

--带空格的单行压缩
function oneLine2(ls)
    local x = ls.alltoken
    local code = ""
    local content = ""
    local front_t = -1
    local curr = -1

    for k,v in ipairs(x) do
        content = v[2]
        curr = v[1]

        --如果是关键字 或 基本数据类型 或 变量名
        if RESERVED[curr] and ((curr >=257 and curr <=278) or (curr>=290 and curr<=293)) then
            front_t = (x[k-1] and x[k-1] or {-1})[1]
            if front_t == 46 or front_t == 58 then
                if code:sub(-1,-1) == " " then
                    code = code:sub(1,-2)
                end
              else
                if code:sub(-1,-1) ~= " " then
                    code = code.." "
                end
            end
          else
            if curr~=666 then
                if curr == 46 or curr == 58 then
                    if code:sub(-1,-1) == " " then
                        code = code:sub(1,-2)
                    end
                  else
                    if code:sub(-1,-1) ~= " " then
                        code = code.." "
                    end
                end
              else
                content = ""
            end
        end
        code = code..content.." "
    end
    return code
end


---换行  +  缩进
--在luaj的大循环中 or and 短接或 if elseif 过多次执行时，不如表访问，所以以下表来判断
isNewLineKeysL = {
    [258] = true,
    [260] = true,
    [261] = true,
    [262] = true,
    [264] = true,
    [265] = true,
    [266] = true,
    [267] = true,
    [269] = true,
    [273] = true,
    [274] = true,
    [277] = true,
    [278] = true,
    [288] = true,
    [666] = true
}

isNewLineKeysR = {
    [44] = true,
    [59] = true,
    [258] = true,
    [259] = true,
    [260] = true,
    [262] = true,
    [273] = true,
    [275] = true,
    [288] = true,
    [666] = true
}

isSpaceKeysL = {
    [35] = true,
    [37] = true,
    [38] = true,
    [42] = true,
    [43] = true,
    [45] = true,
    [47] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [94] = true,
    [124] = true,
    [126] = true,
    [257] = true,
    [259] = true,
    [268] = true,
    [270] = true,
    [271] = true,
    [272] = true,
    [275] = true,
    [276] = true,
    [279] = true,
    [280] = true,
    [281] = true,
    [282] = true,
    [283] = true,
    [284] = true,
    [285] = true,
    [286] = true,
    [287] = true,
    [295] = true,
    [296] = true,
    [297] = true,
    [298] = true,
    [299] = true,
    [300] = true,
    [301] = true,
    [302] = true,
    [303] = true,
    [304] = true,
    [305] = true,
    [306] = true
}

isSpaceKeysR = {
    [37] = true,
    [38] = true,
    [42] = true,
    [43] = true,
    [44] = true,
    [45] = true,
    [47] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [94] = true,
    [124] = true,
    [126] = true,
    [257] = true,
    [261] = true,
    [263] = true,
    [264] = true,
    [265] = true,
    [266] = true,
    [267] = true,
    [268] = true,
    [269] = true,
    [270] = true,
    [271] = true,
    [272] = true,
    [274] = true,
    [276] = true,
    [277] = true,
    [278] = true,
    [279] = true,
    [280] = true,
    [281] = true,
    [282] = true,
    [283] = true,
    [284] = true,
    [285] = true,
    [286] = true,
    [287] = true,
    [295] = true,
    [296] = true,
    [297] = true,
    [298] = true,
    [299] = true,
    [300] = true,
    [301] = true,
    [302] = true,
    [303] = true,
    [304] = true,
    [305] = true,
    [306] = true
}

function isBracketL(op)
    return op==40 or op==91 or op==123
end

function isBracketR(op)
    return op==41 or op==93 or op==125
end

function isUnopr(op) --一元
    return op==35 or op==45 or op==126
end

isValues = {
    [263] = true,
    [270] = true,
    [276] = true,
    [290] = true,
    [291] = true,
    [292] = true,
    [293] = true
}

isIndent = {
    [123] = 1,
    [125] = -1,
    [259] = 1,
    [262] = -1,
    [265] = 1,
    [267] = 1,
    [273] = 1,
    [277] = -1,
}

function indent(op, n)
    local width = 4
    local idts = ""

    local len = n*width-1
    if op==260 or op==261 then
        len = len - 2
    end
    for i=0,len do
        idts = idts.." "
    end
    return idts
end

function restoreLine(ls, comment)
    local x = ls.alltoken
    local code = ""
    local content = ""
    local curr = -1
    local later = {}
    local tk = -1
    local def = {-1,-1}
    local isShort = true
    local idt = 0
    local stack = {}
    local stack_len = 0

    for k,v in pairs(x) do
        curr = v[1]
        content = v[2]
        later = (x[k-1] and x[k-1] or def)
        tk = later[1]
        if curr ~= 666 then
            if isUnopr(curr) then --处理一元运算符
                if v.type == "unopr" then
                    if isSpaceKeysR[kt] then
                        code = code..content
                      else
                        code = code.." "..content
                    end
                  else
                    if isSpaceKeysR[tk] then --上个元素是否已在右侧填充空格
                        code = code..content
                      else
                        code = code.." "..content.." "
                    end
                end

              elseif curr==44 or curr==59 then --处理 , 或 ;
                if stack_len > 0 then
                    isShort = stack[stack_len].style == "shortTableLeft"
                  else
                    isShort = false
                end
                if curr == 59 or (v.type=="separator" and (not isShort)) then --如果是; 或者是长表中的元素分隔符
                    code = code..content.."\n"
                    isNewLineKeysR[44] = true
                    isNewLineKeysR[59] = true
                  else
                    if tk == 262 then
                        code = code..content.."\n"
                        isNewLineKeysR[44] = true
                        isNewLineKeysR[59] = true
                      else
                        code = code..content.." "
                        isNewLineKeysR[44] = false
                        isNewLineKeysR[59] = false
                    end
                end

              elseif curr == 123 then --{
                stack_len = stack_len + 1
                stack[stack_len] = v
                if (not isNewLineKeysR[tk]) and (not isSpaceKeysR[tk]) then
                    code = code.." "
                  elseif isNewLineKeysR[tk] then
                    code = code..indent(curr, idt)
                end
                if v.style == "shortTableLeft" then
                    code = code..content
                    isNewLineKeysR[123] = false
                  else
                    code = code..content.."\n"
                    isNewLineKeysR[123] = true
                end
                idt = idt + 1
                isShort = stack[stack_len].style == "shortTableLeft"

              elseif curr == 125 then --}
                idt = idt - 1
                isShort = stack[stack_len].style == "shortTableLeft"
                if (not isNewLineKeysR[tk]) and (not isSpaceKeysR[tk]) then
                    if not isValues[tk] and tk ~= 666 then
                        code = code.." "
                    end
                end
                if v.style == "shortTableRight" then
                    if tk == 666 then
                        code = code..indent(curr, idt)..content
                      else
                        code = code..content
                    end
                  else
                    if isNewLineKeysR[tk] then
                        code = code..indent(curr, idt)..content
                      else
                        code = code.."\n"..indent(curr, idt)..content
                    end

                    local front = (x[k+1] and x[k+1] or def)[1]
                    if (front>=257 and front<=278) or (front>=290 and front<=293) or front==666 then
                        code = code.."\n"
                    end
                end
                stack[stack_len] = nil
                stack_len = stack_len - 1

              elseif curr == 288 then --::
                if v.type == "dbcolon" then
                    code = code.."\n"..indent(curr, idt)..content
                    isNewLineKeysR[curr] = false
                  else
                    code = code..content.."\n"
                    isNewLineKeysR[curr] = true
                end

              elseif curr == 259 then --do
                idt = idt + 1
                if isNewLineKeysL[curr] then
                    if not isNewLineKeysR[tk] then
                        code = code.."\n"..indent(curr, idt)..content.."\n"
                      else
                        code = code..indent(curr, idt)..content.."\n"
                    end
                  elseif isSpaceKeysL[curr] then
                    if not isSpaceKeysR[tk] then
                        code = code.." "..content.."\n"
                      else
                        code = code..content.."\n"
                    end
                end
                isNewLineKeysL[259] = true
                isNewLineKeysR[259] = true
                isSpaceKeysL[259] = false
              else

                if curr == 264 or curr == 278 then --当遇到for 和 while时 do的左侧不换行
                    isNewLineKeysL[259] = false
                    isSpaceKeysL[259] = true
                end
                if curr == 261 then --elseif前多换一行
                    code = code.."\n"
                end

                if (not isNewLineKeysR[tk]) and isNewLineKeysL[curr] then --上个token没有右侧换行，本次token需要左侧换行的，中间补上换行符
                    if curr == 265 and (tk == 40 or tk == 91 or tk == 61) then --function的处理
                        code = code.." "..content
                        idt = idt + 1
                      elseif curr == 265 then
                        code = code.."\n\n"..indent(curr, idt)..content
                        idt = idt + 1
                      else
                        if curr==262 or curr==277 then
                            idt = idt - 1
                            code = code.."\n"..indent(curr, idt)..content
                          else
                            code = code.."\n"..indent(curr, idt)..content
                            idt = idt + (isIndent[curr] or 0)
                        end
                    end

                  elseif isNewLineKeysR[tk] then --上个token已经换行的，补缩进
                    if curr == 265 then
                        code = code.."\n"..indent(curr, idt)..content
                        idt = idt + 1
                      else
                        if curr==262 or curr==277 then
                            idt = idt - 1
                            code = code..indent(curr, idt)..content
                          else
                            code = code..indent(curr, idt)..content
                            idt = idt + (isIndent[curr] or 0)
                        end
                    end
                  elseif (isBracketR(tk) or isValues[tk]) and isValues[curr] then --上个token是右括号或值，本次token是值的，需要换行
                    code = code.."\n"..indent(curr, idt)..content
                  elseif (not isSpaceKeysR[tk]) and isSpaceKeysL[curr] then --上个token没有右侧空格，本次token需要左侧空格的，中间补上空格
                    code = code.." "..content
                  elseif isSpaceKeysR[tk] then --上个token已经空格的
                    code = code..content
                  else
                    code = code..content
                end

                if isNewLineKeysR[curr] then
                    if curr == 262 then
                        local front = (x[k+1] and x[k+1] or def)[1]
                        if (front>=257 and front<=278) or (front>=290 and front<=293) or front==666 or front==125 then
                            code = code.."\n"
                        end
                      else
                        code = code.."\n"
                    end
                  elseif isSpaceKeysR[curr] then
                    local front = (x[k+1] and x[k+1] or def)[1]
                    if front ~= 44 and front ~= 59 then
                        code = code.." "
                    end
                end

            end

          else

            if comment then
                if not isNewLineKeysR[tk] then
                    code = code.."\n"
                end
                code = code..indent(curr, idt)..content.."\n"
              else
                if not isNewLineKeysR[tk] then
                    code = code.."\n"
                  elseif not isSpaceKeysR[tk] then
                    code = code.." "
                end
            end
        end
    end
    return code
end

-----------------分析区结束-------------


-----------------配置其他运行所需函数-----------
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

if not gg then --用于兼容其他运行平台
    gg = {}
    gg.alert = print
    gg.prompt = function(tips, values, types)
        return values
    end
    gg.choice = function(functions, choice)
        if choice >0 and choice <= 4 then
            return choice
        end
        return nil
    end
end

if luajava then --开始解析时间
    Sys = luajava.bindClass("java.lang.System")
    unit = "毫秒"
  else
    unit = "秒"
end

function currentTime() --获取当前时间
    if Sys then
        return Sys.currentTimeMillis()
      else
        return os.time()
    end
end
--------------------------------


----------------------分析器功能调用--------------
gg.alert("1.6.0增加了对复合运算符的识别，增加了变量名内存在$字符的识别\n\n重写了格式化功能\n\n格式化功能为词法分析功能运用情况之一，混淆实现可参考另外一个脚本\n\n1.6.2优化了表格格式化")


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

time1 = currentTime()

local ls = Llex(code)

time2 = currentTime()

--------功能区------
--使用词法分析，实现代码格式化功能
local Format = gg.choice({"无空单行压缩(注释不保留，去除多余空格，删除换行符)", "有空单行压缩(注释不保留，词与词之间插入空格，删除换行符)", "将单行恢复为正常换行并缩进(注释不保留)", "正常缩进(保留注释)"}, 1)
if not Format then print("你什么也没操作") os.exit() end

time3 = currentTime()

if Format==1 then
    OutPath = outpath.."[无空压缩]"..os.time()..".lua"
    code = oneLine(ls)
  elseif Format==2 then
    OutPath = outpath.."[有空压缩]"..os.time()..".lua"
    code = oneLine2(ls)
  elseif Format==3 then
    OutPath = outpath.."[恢复换行并缩进]"..os.time()..".lua"
    code = restoreLine(ls, false)
  elseif Format==4 then
    OutPath = outpath.."[正常缩进]"..os.time()..".lua"
    code = restoreLine(ls, true)
end
local u=io.open(OutPath,"w+") --写出到文件
u:write(code)
u:close()

--------------------

--print(ls.alltoken)
--alltoken为Lua代码分词（token）列表{[key]=value,}
--key从1开始排到Lua代码的最后一个有效token
--value为一个表，表中[1]为token类型（如TK_STRING）的十进制值
--[2]为该token对应的实际代码，可对这些代码进行处理，并拼接为Lua源代码
--["type"]表示TK_NAME类型的token是全局变量还是局部变量，global为全局，local为局部变量
--["style"]表示TK_NAME类型在代码中出现的格式
--type和style值均用于辅助处理变量的混淆

------------------
time4 = currentTime()

local content = "解析时长"..(time2-time1)..unit.."\n"..
"格式化时长"..(time4-time3)..unit.."\n"..
"总运行时长"..(time4-time1)..unit
gg.alert(content)