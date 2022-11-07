{

  inputs.packument.url   = "https://registry.npmjs.org/retry?rev=86-e0b404512644d6041de2ab2ae1108a79";
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
    ident = "retry";
    ldir  = "info/unscoped/r/retry";
    inherit packument fetchInfo;
  } // latest';

}
