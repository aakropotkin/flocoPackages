{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.includes?rev=23-5cd5acf21b616e5cbabcfb3a5843cb30";
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
    ident = "lodash.includes";
    ldir  = "info/unscoped/l/lodash.includes";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
