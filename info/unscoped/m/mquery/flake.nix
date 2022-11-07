{

  inputs.packument.url   = "https://registry.npmjs.org/mquery?rev=132-8014cb96370c5f0b0b1e7134e5fa5582";
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
    ident = "mquery";
    ldir  = "info/unscoped/m/mquery";
    inherit packument fetchInfo;
  } // latest';

}
