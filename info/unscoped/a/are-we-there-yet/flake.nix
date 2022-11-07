{

  inputs.packument.url   = "https://registry.npmjs.org/are-we-there-yet?rev=59-9c2fd2ed494a3607b0af214ae59e0510";
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
    ident = "are-we-there-yet";
    ldir  = "info/unscoped/a/are-we-there-yet";
    inherit packument fetchInfo;
  } // latest';

}
