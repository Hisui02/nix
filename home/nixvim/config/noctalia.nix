{pkgs, ... }: 
{
	extraPlugins = [ pkgs.vimPlugins.base16-nvim ];

	extraConfigLua = ''
		local ok, matugen = pcall(require, 'matugen')
		if ok then
			matugen.setup()
		end
	'';
}
