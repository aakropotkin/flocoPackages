{

  inputs.packument.url   = "https://registry.npmjs.org/json-parse-even-better-errors?rev=22-6327580adc58d3821e2e3e644cbfd8bb";
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
    ident = "json-parse-even-better-errors";
    ldir  = "info/unscoped/j/json-parse-even-better-errors";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
