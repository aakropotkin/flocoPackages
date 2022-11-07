{

  inputs.packument.url   = "https://registry.npmjs.org/pug?rev=280-d9214c8636fd9b75719aa1259c8d640f";
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
    ident = "pug";
    ldir  = "info/unscoped/p/pug";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
