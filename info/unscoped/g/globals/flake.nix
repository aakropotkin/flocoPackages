{

  inputs.packument.url   = "https://registry.npmjs.org/globals?rev=135-ce58a0aafb494b196f866f67eb9a5c89";
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
    ident = "globals";
    ldir  = "info/unscoped/g/globals";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
