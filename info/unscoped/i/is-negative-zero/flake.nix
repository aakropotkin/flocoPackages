{

  inputs.packument.url   = "https://registry.npmjs.org/is-negative-zero?rev=18-49b54df1a89521df6e55fb893a624060";
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
    ident = "is-negative-zero";
    ldir  = "info/unscoped/i/is-negative-zero";
    inherit packument fetchInfo;
  } // latest';

}
