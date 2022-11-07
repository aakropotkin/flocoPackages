{

  inputs.packument.url   = "https://registry.npmjs.org/long?rev=104-30f79e37b5091191888cc86ad86c4242";
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
    ident = "long";
    ldir  = "info/unscoped/l/long";
    inherit packument fetchInfo;
  } // latest';

}
