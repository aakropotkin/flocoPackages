{

  inputs.packument.url   = "https://registry.npmjs.org/whatwg-mimetype?rev=9-4a63ddd34880a645601c398392074d80";
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
    ident = "whatwg-mimetype";
    ldir  = "info/unscoped/w/whatwg-mimetype";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
