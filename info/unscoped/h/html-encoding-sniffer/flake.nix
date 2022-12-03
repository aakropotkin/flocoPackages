{

  inputs.packument.url   = "https://registry.npmjs.org/html-encoding-sniffer";
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
    ident = "html-encoding-sniffer";
    ldir  = "info/unscoped/h/html-encoding-sniffer";
    inherit packument fetchInfo;
  } // latest';

}
