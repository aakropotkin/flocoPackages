{

  inputs.packument.url   = "https://registry.npmjs.org/html-encoding-sniffer?rev=11-f3b1b58b9667847ab72e958978f54764";
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
