{

  inputs.packument.url   = "https://registry.npmjs.org/ext-list?rev=20-3e8eca595ffeb995fdc108df3b469ecc";
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
    ident = "ext-list";
    ldir  = "info/unscoped/e/ext-list";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
