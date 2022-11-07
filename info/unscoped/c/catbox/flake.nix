{

  inputs.packument.url   = "https://registry.npmjs.org/catbox?rev=244-f80999a0e8b51d06f5548065df1c1639";
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
    ident = "catbox";
    ldir  = "info/unscoped/c/catbox";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
