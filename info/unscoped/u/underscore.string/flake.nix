{

  inputs.packument.url   = "https://registry.npmjs.org/underscore.string?rev=153-fc7ad1343f44ff439f2ba5e6c831d1eb";
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
    ident = "underscore.string";
    ldir  = "info/unscoped/u/underscore.string";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
