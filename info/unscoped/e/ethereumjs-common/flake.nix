{

  inputs.packument.url   = "https://registry.npmjs.org/ethereumjs-common?rev=27-f7450cc273b7208b1c1778d10500fd8a";
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
    ident = "ethereumjs-common";
    ldir  = "info/unscoped/e/ethereumjs-common";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
