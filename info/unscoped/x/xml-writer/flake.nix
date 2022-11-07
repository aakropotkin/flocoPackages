{

  inputs.packument.url   = "https://registry.npmjs.org/xml-writer?rev=57-bfde0c93b873c455ff41670d45860e1a";
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
    ident = "xml-writer";
    ldir  = "info/unscoped/x/xml-writer";
    inherit packument fetchInfo;
  } // latest';

}
