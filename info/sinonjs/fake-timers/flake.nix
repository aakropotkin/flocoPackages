{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@sinonjs%2ffake-timers?_rev=24-744295d60cf16d527671ade6fda47c1e";
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
    scope = "@sinonjs";
    ident = "@sinonjs/fake-timers";
    ldir  = "info/sinonjs/fake-timers";
    inherit packument fetchInfo;
  } // latest';

}
