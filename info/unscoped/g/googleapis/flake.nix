{

  inputs.packument.url   = "https://registry.npmjs.org/googleapis?rev=426-8a84a74b9faea23513c3893415ca1d12";
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
    ident = "googleapis";
    ldir  = "info/unscoped/g/googleapis";
    inherit packument fetchInfo;
  } // latest';

}
