{

  inputs.packument.url   = "https://registry.npmjs.org/ember-rfc176-data?rev=33-bc76151319b466eabdaae710b4b51f26";
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
    ident = "ember-rfc176-data";
    ldir  = "info/unscoped/e/ember-rfc176-data";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
