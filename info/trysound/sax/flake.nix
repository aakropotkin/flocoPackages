{

  inputs.packument.url   = "https://registry.npmjs.org/@trysound/sax?rev=3-106b478cdba67ad5aed45a7494d36943";
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
    scope = "@trysound";
    ident = "@trysound/sax";
    ldir  = "info/trysound/sax";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
