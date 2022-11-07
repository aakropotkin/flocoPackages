{

  inputs.packument.url   = "https://registry.npmjs.org/detective?rev=100-477a768716b7559e9b741bf3707647da";
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
    ident = "detective";
    ldir  = "info/unscoped/d/detective";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
