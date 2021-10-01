package luaj.lib;
import luaj.LuaValue;
import luaj.LuaTable;
import luaj.LuaString;
import luaj.Varargs;

//首先新建一个StringLib继承TwoArgFunction
public class StringLib extends TwoArgFunction {
	//实例化方法
	public StringLib() {}
    //可执行方法主体
	public LuaValue call(LuaValue modname, LuaValue env) {
		//modname可传入的第一个参数，这里用不上
		//env全局环境
		
		//新建一个表
		LuaTable string = new LuaTable();
		//LuaTable对应脚本里{}表
		
		//向string库里设置新函数，函数名为"测试类是"
		string.set("测试类", new 测试类());
        //这里用到了LuaTable类中的set方法
		//set方法在很多类都有，而且参数不同
		//这里的第一个参数为String，第二个参数为LuaFunction
		
		env.set("string", string);
		//set方法，第一个参数为String，第二个参数为LuaTable
		//LuaTable、LuaFunction等均继承于LuaValue
		
		if (!env.get("package").isnil()) env.get("package").get("loaded").set("string", string);
		//get方法，也有多种，这里的是传入string进行取值
		//对应于_G.package
		//isnil判断对象是否为nil值
		
		//s_metatable  LuaString的元方法
		if (LuaString.s_metatable == null) {
			//LuaValue.tableOf将LuaValue[]等转为什么LuaTable
			LuaString.s_metatable = LuaValue.tableOf(new LuaValue[] { INDEX, string });
		}
		return string;
	}

	//StringLib的子类，用于编写String库的函数
	//继承了VarArgFunction
	static final class 测试类 extends VarArgFunction {
		//Varargs 为Lua的最顶层对象，其他主要类均继承于它
		
		//invoke执行入口
		//args为从Lua脚本里传入的可变传参
		public Varargs invoke(Varargs args) {
			
			return args;
		}
	}
}
