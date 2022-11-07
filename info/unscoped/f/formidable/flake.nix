{

  inputs.packument.url   = "https://registry.npmjs.org/formidable?rev=520-09349f8e77797fc1e1fab63c23d3efc5";
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
    ident = "formidable";
    ldir  = "info/unscoped/f/formidable";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
