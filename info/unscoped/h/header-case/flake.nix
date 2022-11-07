{

  inputs.packument.url   = "https://registry.npmjs.org/header-case?rev=10-922a792e417ca0f5a878266ba7c12b72";
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
    ident = "header-case";
    ldir  = "info/unscoped/h/header-case";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
