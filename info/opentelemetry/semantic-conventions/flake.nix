{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@opentelemetry%2fsemantic-conventions?_rev=91-ec30f4a1d73847cbc75891364f8d2098";
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
    scope = "@opentelemetry";
    ident = "@opentelemetry/semantic-conventions";
    ldir  = "info/opentelemetry/semantic-conventions";
    inherit packument fetchInfo;
  } // latest';

}
