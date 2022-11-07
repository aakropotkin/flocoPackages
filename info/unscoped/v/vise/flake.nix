{

  inputs.packument.url   = "https://registry.npmjs.org/vise?rev=45-b1b6867aaa1ee93331055c012183d218";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "vise";
    ldir  = "info/unscoped/v/vise";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
