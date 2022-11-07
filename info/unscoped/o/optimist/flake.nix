{

  inputs.packument.url   = "https://registry.npmjs.org/optimist?rev=331-99cda9f3c912d728f2343f4f184ac266";
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
    ident = "optimist";
    ldir  = "info/unscoped/o/optimist";
    inherit packument fetchInfo;
  } // latest';

}
