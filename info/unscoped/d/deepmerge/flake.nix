{

  inputs.packument.url   = "https://registry.npmjs.org/deepmerge?rev=96-b7be0622f4f759722dbdb8400bb431d8";
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
    ident = "deepmerge";
    ldir  = "info/unscoped/d/deepmerge";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
