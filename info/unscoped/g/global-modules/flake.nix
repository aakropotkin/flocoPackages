{

  inputs.packument.url   = "https://registry.npmjs.org/global-modules?rev=22-a18bbc03ba3565fd4198b2fb13b9a6f7";
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
    ident = "global-modules";
    ldir  = "info/unscoped/g/global-modules";
    inherit packument fetchInfo;
  } // latest';

}
