{

  inputs.packument.url   = "https://registry.npmjs.org/dot-case?rev=26-a503ebd19e6d3b1d890febc23cefc070";
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
    ident = "dot-case";
    ldir  = "info/unscoped/d/dot-case";
    inherit packument fetchInfo;
  } // latest';

}
