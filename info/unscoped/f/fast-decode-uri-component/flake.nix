{

  inputs.packument.url   = "https://registry.npmjs.org/fast-decode-uri-component?rev=3-158a58f41ae241f5307730e036a54cce";
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
    ident = "fast-decode-uri-component";
    ldir  = "info/unscoped/f/fast-decode-uri-component";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
