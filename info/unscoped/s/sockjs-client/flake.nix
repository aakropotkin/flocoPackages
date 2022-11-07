{

  inputs.packument.url   = "https://registry.npmjs.org/sockjs-client?rev=71-c49d9fc569dc97607f7bcdece6c1e662";
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
    ident = "sockjs-client";
    ldir  = "info/unscoped/s/sockjs-client";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
