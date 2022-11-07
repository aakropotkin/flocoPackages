{

  inputs.packument.url   = "https://registry.npmjs.org/to-fast-properties?rev=13-170516d620120c6b3ed008b87131f00e";
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
    ident = "to-fast-properties";
    ldir  = "info/unscoped/t/to-fast-properties";
    inherit packument fetchInfo;
  } // latest';

}
